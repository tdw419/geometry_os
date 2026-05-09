; DESCRIPTION: Composite: Renders a cyan disk with center (389, 139) and radius 23 then Renders a orange box of size 86x98 starting at (93, 137) then Places a yellow line segment connecting (267, 86) to (257, 67).
; PLAN: r0=389(x), r1=139(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=137(y), r7=86(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x1), r11=86(y1), r12=257(x2), r13=67(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 139
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 137
LDI r7, 86
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 86
LDI r12, 257
LDI r13, 67
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
