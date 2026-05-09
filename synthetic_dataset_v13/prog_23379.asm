; DESCRIPTION: Composite: Sets a single blue pixel at (261, 201) then Places a green 14x69 rectangle at position (0, 172) then Renders a red disk with center (313, 188) and radius 64.
; PLAN: r0=261(x), r1=201(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=172(y), r7=14(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=188(y), r12=64(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 201
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 172
LDI r7, 14
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 188
LDI r12, 64
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
