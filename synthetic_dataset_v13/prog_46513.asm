; DESCRIPTION: Composite: Sets a single blue pixel at (211, 188) then Renders a black disk with center (352, 164) and radius 58 then Places a yellow 90x97 rectangle at position (20, 100).
; PLAN: r0=211(x), r1=188(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=164(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=100(y), r12=90(width), r13=97(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 188
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 164
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 100
LDI r12, 90
LDI r13, 97
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
