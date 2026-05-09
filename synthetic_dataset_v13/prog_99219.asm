; DESCRIPTION: Composite: Sets a single green pixel at (444, 40) then Places a yellow 70x68 rectangle at position (160, 160) then Places a blue line segment connecting (72, 67) to (157, 18).
; PLAN: r0=444(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=160(y), r7=70(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x1), r11=67(y1), r12=157(x2), r13=18(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 160
LDI r6, 160
LDI r7, 70
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 67
LDI r12, 157
LDI r13, 18
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
