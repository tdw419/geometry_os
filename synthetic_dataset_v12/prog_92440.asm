; DESCRIPTION: Composite: Places a white line segment connecting (4, 230) to (161, 151) then Renders a orange box of size 84x53 starting at (417, 196) then Places a yellow circle of radius 31 at center (384, 65).
; PLAN: r0=4(x1), r1=230(y1), r2=161(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=196(y), r7=84(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x), r11=65(y), r12=31(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 230
LDI r2, 161
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 196
LDI r7, 84
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 65
LDI r12, 31
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
