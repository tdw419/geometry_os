; DESCRIPTION: Composite: Renders a yellow box of size 20x26 starting at (92, 39) then Places a magenta dot at position (148, 85) then Creates a blue circular shape at (188, 153) with radius 68.
; PLAN: r0=92(x), r1=39(y), r2=20(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=85(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=188(x), r11=153(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 39
LDI r2, 20
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 85
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 188
LDI r11, 153
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
