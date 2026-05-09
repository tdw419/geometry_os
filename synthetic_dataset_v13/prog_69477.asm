; DESCRIPTION: Composite: Draws a blue line from (9, 154) to (291, 85) then Sets a single orange pixel at (92, 43).
; PLAN: r0=9(x1), r1=154(y1), r2=291(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=43(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 154
LDI r2, 291
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 43
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
