; DESCRIPTION: Composite: Draws a purple rectangle at (39, 168) with width 83 and height 65 then Places a green circle of radius 69 at center (442, 178) then Places a white line segment connecting (315, 215) to (470, 132).
; PLAN: r0=39(x), r1=168(y), r2=83(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=178(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x1), r11=215(y1), r12=470(x2), r13=132(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 168
LDI r2, 83
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 178
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 215
LDI r12, 470
LDI r13, 132
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
