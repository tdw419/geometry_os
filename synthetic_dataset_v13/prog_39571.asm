; DESCRIPTION: Places a cyan line segment connecting (226, 217) to (475, 7).
; PLAN: r0=226(x1), r1=217(y1), r2=475(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 217
LDI r2, 475
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
