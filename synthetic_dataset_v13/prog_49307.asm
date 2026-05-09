; DESCRIPTION: Composite: Sets a single magenta pixel at (205, 192) then Renders a blue disk with center (63, 208) and radius 42 then Renders a white box of size 81x52 starting at (431, 69).
; PLAN: r0=205(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=208(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=69(y), r12=81(width), r13=52(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 192
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 208
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 69
LDI r12, 81
LDI r13, 52
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
