; DESCRIPTION: Composite: Renders a orange disk with center (362, 218) and radius 27 then Sets a single blue pixel at (486, 177) then Draws a magenta rectangle at (429, 64) with width 78 and height 34.
; PLAN: r0=362(x), r1=218(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x), r6=177(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=429(x), r11=64(y), r12=78(width), r13=34(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 218
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 177
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 429
LDI r11, 64
LDI r12, 78
LDI r13, 34
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
