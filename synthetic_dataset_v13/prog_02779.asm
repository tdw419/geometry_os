; DESCRIPTION: Composite: Renders a orange box of size 41x13 starting at (321, 179) then Places a green circle of radius 42 at center (201, 130) then Draws a blue line from (139, 83) to (70, 53).
; PLAN: r0=321(x), r1=179(y), r2=41(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=130(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x1), r11=83(y1), r12=70(x2), r13=53(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 179
LDI r2, 41
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 130
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 83
LDI r12, 70
LDI r13, 53
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
