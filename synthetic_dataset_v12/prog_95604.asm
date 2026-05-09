; DESCRIPTION: Composite: Draws a black circle centered at (378, 168) with radius 17 then Draws a blue line from (366, 54) to (504, 76) then Places a blue 40x39 rectangle at position (417, 91).
; PLAN: r0=378(x), r1=168(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=54(y1), r7=504(x2), r8=76(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=91(y), r12=40(width), r13=39(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 168
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 54
LDI r7, 504
LDI r8, 76
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 91
LDI r12, 40
LDI r13, 39
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
