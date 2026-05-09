; DESCRIPTION: Composite: Draws a magenta line from (242, 62) to (335, 30) then Places a orange dot at position (430, 212).
; PLAN: r0=242(x1), r1=62(y1), r2=335(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=212(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 62
LDI r2, 335
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 212
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
