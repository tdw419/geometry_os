; DESCRIPTION: Composite: Draws a blue circle centered at (259, 110) with radius 71 then Renders a cyan line between points (341, 160) and (238, 192) then Renders a orange box of size 65x74 starting at (407, 42).
; PLAN: r0=259(x), r1=110(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x1), r6=160(y1), r7=238(x2), r8=192(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=42(y), r12=65(width), r13=74(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 110
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 160
LDI r7, 238
LDI r8, 192
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 42
LDI r12, 65
LDI r13, 74
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
