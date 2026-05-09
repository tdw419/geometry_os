; DESCRIPTION: Composite: Places a white dot at position (214, 243) then Renders a magenta disk with center (29, 177) and radius 24 then Renders a purple box of size 80x22 starting at (127, 158).
; PLAN: r0=214(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=177(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x), r11=158(y), r12=80(width), r13=22(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 29
LDI r6, 177
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 158
LDI r12, 80
LDI r13, 22
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
