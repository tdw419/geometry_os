; DESCRIPTION: Composite: Sets a single yellow pixel at (493, 182) then Renders a green box of size 35x85 starting at (237, 42) then Draws a black circle centered at (336, 100) with radius 24.
; PLAN: r0=493(x), r1=182(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=42(y), r7=35(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=336(x), r11=100(y), r12=24(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 182
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 237
LDI r6, 42
LDI r7, 35
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 100
LDI r12, 24
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
