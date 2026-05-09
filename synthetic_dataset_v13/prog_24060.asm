; DESCRIPTION: Composite: Places a red dot at position (371, 213) then Places a blue 55x105 rectangle at position (233, 2) then Renders a black disk with center (457, 181) and radius 48.
; PLAN: r0=371(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=2(y), r7=55(width), r8=105(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x), r11=181(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 233
LDI r6, 2
LDI r7, 55
LDI r8, 105
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 181
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
