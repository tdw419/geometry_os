; DESCRIPTION: Composite: Sets a single green pixel at (247, 36) then Renders a orange disk with center (432, 126) and radius 51 then Renders a blue box of size 15x28 starting at (120, 1).
; PLAN: r0=247(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=126(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=1(y), r12=15(width), r13=28(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 432
LDI r6, 126
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 1
LDI r12, 15
LDI r13, 28
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
