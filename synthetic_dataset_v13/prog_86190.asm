; DESCRIPTION: Composite: Places a black 33x70 rectangle at position (90, 132) then Places a cyan line segment connecting (490, 222) to (44, 19) then Draws a cyan circle centered at (422, 129) with radius 62.
; PLAN: r0=90(x), r1=132(y), r2=33(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x1), r6=222(y1), r7=44(x2), r8=19(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=129(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 132
LDI r2, 33
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 222
LDI r7, 44
LDI r8, 19
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 129
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
