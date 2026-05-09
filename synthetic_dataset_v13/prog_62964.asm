; DESCRIPTION: Composite: Places a magenta 117x96 rectangle at position (44, 45) then Renders a cyan line between points (379, 197) and (443, 104) then Creates a red circular shape at (86, 122) with radius 66.
; PLAN: r0=44(x), r1=45(y), r2=117(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x1), r6=197(y1), r7=443(x2), r8=104(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=122(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 45
LDI r2, 117
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 197
LDI r7, 443
LDI r8, 104
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 122
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
