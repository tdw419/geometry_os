; DESCRIPTION: Composite: Renders a magenta disk with center (166, 181) and radius 54 then Sets a single orange pixel at (173, 252).
; PLAN: r0=166(x), r1=181(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=252(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 181
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 252
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
