; DESCRIPTION: Composite: Draws a black rectangle at (42, 21) with width 72 and height 42 then Sets a single white pixel at (496, 209) then Renders a red line between points (154, 130) and (136, 208).
; PLAN: r0=42(x), r1=21(y), r2=72(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=209(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=130(y1), r12=136(x2), r13=208(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 21
LDI r2, 72
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 209
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 130
LDI r12, 136
LDI r13, 208
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
