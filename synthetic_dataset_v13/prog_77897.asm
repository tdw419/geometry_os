; DESCRIPTION: Places a cyan line segment connecting (217, 20) to (76, 138).
; PLAN: r0=217(x1), r1=20(y1), r2=76(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 20
LDI r2, 76
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
