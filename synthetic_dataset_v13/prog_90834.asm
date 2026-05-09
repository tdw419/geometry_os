; DESCRIPTION: Places a cyan line segment connecting (306, 221) to (371, 77).
; PLAN: r0=306(x1), r1=221(y1), r2=371(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 221
LDI r2, 371
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
