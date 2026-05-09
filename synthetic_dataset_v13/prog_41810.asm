; DESCRIPTION: Composite: Places a magenta line segment connecting (378, 1) to (126, 106) then Renders a blue disk with center (455, 55) and radius 24 then Places a orange 13x103 rectangle at position (398, 13).
; PLAN: r0=378(x1), r1=1(y1), r2=126(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=55(y), r7=24(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=398(x), r11=13(y), r12=13(width), r13=103(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 1
LDI r2, 126
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 55
LDI r7, 24
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 398
LDI r11, 13
LDI r12, 13
LDI r13, 103
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
