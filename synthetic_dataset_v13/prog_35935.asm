; DESCRIPTION: Composite: Places a cyan line segment connecting (271, 192) to (196, 226) then Places a yellow 48x114 rectangle at position (379, 48) then Renders a purple disk with center (252, 115) and radius 44.
; PLAN: r0=271(x1), r1=192(y1), r2=196(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=48(y), r7=48(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x), r11=115(y), r12=44(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 192
LDI r2, 196
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 48
LDI r7, 48
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 115
LDI r12, 44
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
