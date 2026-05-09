; DESCRIPTION: Composite: Draws a red circle centered at (147, 100) with radius 73 then Sets a single blue pixel at (280, 111) then Renders a cyan box of size 10x29 starting at (173, 3).
; PLAN: r0=147(x), r1=100(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=111(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=3(y), r12=10(width), r13=29(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 100
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 111
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 173
LDI r11, 3
LDI r12, 10
LDI r13, 29
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
