; DESCRIPTION: Composite: Creates a purple circular shape at (178, 118) with radius 34 then Renders a orange box of size 53x25 starting at (179, 57) then Draws a green line from (180, 11) to (325, 247).
; PLAN: r0=178(x), r1=118(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=57(y), r7=53(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x1), r11=11(y1), r12=325(x2), r13=247(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 118
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 57
LDI r7, 53
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 11
LDI r12, 325
LDI r13, 247
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
