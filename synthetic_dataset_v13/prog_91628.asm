; DESCRIPTION: Composite: Creates a purple circular shape at (101, 116) with radius 40 then Places a green line segment connecting (106, 4) to (317, 25) then Renders a orange box of size 96x59 starting at (148, 103).
; PLAN: r0=101(x), r1=116(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x1), r6=4(y1), r7=317(x2), r8=25(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=103(y), r12=96(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 116
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 4
LDI r7, 317
LDI r8, 25
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 103
LDI r12, 96
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
