; DESCRIPTION: Places a orange line segment connecting (425, 215) to (45, 14).
; PLAN: r0=425(x1), r1=215(y1), r2=45(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 215
LDI r2, 45
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
