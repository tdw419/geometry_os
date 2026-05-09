; DESCRIPTION: Composite: Places a blue dot at position (154, 148) then Renders a green box of size 55x40 starting at (209, 96) then Creates a yellow circular shape at (431, 71) with radius 63.
; PLAN: r0=154(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=96(y), r7=55(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x), r11=71(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 96
LDI r7, 55
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 71
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
