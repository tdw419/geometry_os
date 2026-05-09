; DESCRIPTION: Composite: Renders a green box of size 68x59 starting at (328, 63) then Places a yellow dot at position (81, 59) then Creates a purple circular shape at (265, 168) with radius 17.
; PLAN: r0=328(x), r1=63(y), r2=68(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=59(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=168(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 63
LDI r2, 68
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 59
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 265
LDI r11, 168
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
