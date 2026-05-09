; DESCRIPTION: Composite: Draws a blue rectangle at (272, 124) with width 67 and height 90 then Places a white dot at position (157, 124) then Places a purple line segment connecting (146, 226) to (192, 48).
; PLAN: r0=272(x), r1=124(y), r2=67(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=124(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=146(x1), r11=226(y1), r12=192(x2), r13=48(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 124
LDI r2, 67
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 124
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 226
LDI r12, 192
LDI r13, 48
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
