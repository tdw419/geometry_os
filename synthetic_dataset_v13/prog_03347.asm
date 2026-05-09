; DESCRIPTION: Composite: Places a green line segment connecting (33, 175) to (54, 249) then Places a purple 104x47 rectangle at position (297, 73) then Draws a magenta circle centered at (356, 190) with radius 14.
; PLAN: r0=33(x1), r1=175(y1), r2=54(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=73(y), r7=104(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=190(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 175
LDI r2, 54
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 73
LDI r7, 104
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 190
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
