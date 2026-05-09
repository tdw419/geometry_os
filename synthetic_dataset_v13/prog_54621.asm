; DESCRIPTION: Composite: Renders a blue box of size 85x56 starting at (97, 18) then Sets a single orange pixel at (277, 129).
; PLAN: r0=97(x), r1=18(y), r2=85(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=129(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 18
LDI r2, 85
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 129
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
