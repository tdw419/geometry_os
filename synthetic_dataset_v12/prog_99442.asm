; DESCRIPTION: Composite: Creates a cyan circular shape at (253, 81) with radius 28 then Draws a orange rectangle at (263, 93) with width 31 and height 15 then Places a yellow line segment connecting (69, 105) to (374, 168).
; PLAN: r0=253(x), r1=81(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=93(y), r7=31(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x1), r11=105(y1), r12=374(x2), r13=168(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 81
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 93
LDI r7, 31
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 105
LDI r12, 374
LDI r13, 168
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
