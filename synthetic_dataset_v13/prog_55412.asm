; DESCRIPTION: Places a cyan line segment connecting (45, 210) to (23, 145).
; PLAN: r0=45(x1), r1=210(y1), r2=23(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 210
LDI r2, 23
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
