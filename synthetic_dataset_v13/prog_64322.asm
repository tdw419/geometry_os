; DESCRIPTION: Places a cyan line segment connecting (77, 198) to (74, 220).
; PLAN: r0=77(x1), r1=198(y1), r2=74(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 198
LDI r2, 74
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
