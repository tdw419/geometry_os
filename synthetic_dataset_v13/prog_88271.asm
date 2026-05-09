; DESCRIPTION: Draws a white line from (321, 163) to (45, 205).
; PLAN: r0=321(x1), r1=163(y1), r2=45(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 163
LDI r2, 45
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
