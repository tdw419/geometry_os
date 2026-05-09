; DESCRIPTION: Composite: Places a blue line segment connecting (89, 57) to (499, 116) then Renders a blue box of size 40x96 starting at (204, 69) then Places a purple dot at position (330, 245).
; PLAN: r0=89(x1), r1=57(y1), r2=499(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=69(y), r7=40(width), r8=96(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x), r11=245(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 57
LDI r2, 499
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 69
LDI r7, 40
LDI r8, 96
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 245
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
