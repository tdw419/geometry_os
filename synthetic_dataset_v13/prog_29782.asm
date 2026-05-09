; DESCRIPTION: Composite: Draws a blue rectangle at (382, 55) with width 39 and height 49 then Places a black line segment connecting (356, 17) to (326, 209) then Creates a red circular shape at (353, 139) with radius 50.
; PLAN: r0=382(x), r1=55(y), r2=39(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=17(y1), r7=326(x2), r8=209(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=139(y), r12=50(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 55
LDI r2, 39
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 17
LDI r7, 326
LDI r8, 209
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 139
LDI r12, 50
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
