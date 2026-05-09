; DESCRIPTION: Renders a orange line between points (45, 182) and (440, 234).
; PLAN: r0=45(x1), r1=182(y1), r2=440(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 182
LDI r2, 440
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
