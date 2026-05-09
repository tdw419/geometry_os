; DESCRIPTION: Composite: Creates a blue circular shape at (244, 153) with radius 63 then Renders a black box of size 93x24 starting at (104, 216) then Places a purple dot at position (470, 3).
; PLAN: r0=244(x), r1=153(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=216(y), r7=93(width), r8=24(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x), r11=3(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 153
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 216
LDI r7, 93
LDI r8, 24
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 3
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
