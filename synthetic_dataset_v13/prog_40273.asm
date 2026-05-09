; DESCRIPTION: Composite: Sets a single magenta pixel at (481, 196) then Renders a magenta disk with center (230, 174) and radius 22 then Renders a green box of size 114x32 starting at (195, 160).
; PLAN: r0=481(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=174(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=160(y), r12=114(width), r13=32(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 196
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 174
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 160
LDI r12, 114
LDI r13, 32
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
