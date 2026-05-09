; DESCRIPTION: Places a cyan line segment connecting (45, 217) to (256, 20).
; PLAN: r0=45(x1), r1=217(y1), r2=256(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 217
LDI r2, 256
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
