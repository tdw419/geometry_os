; DESCRIPTION: Composite: Places a blue line segment connecting (113, 150) to (236, 90) then Creates a yellow circular shape at (445, 91) with radius 65 then Places a blue 84x114 rectangle at position (330, 83).
; PLAN: r0=113(x1), r1=150(y1), r2=236(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=91(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=330(x), r11=83(y), r12=84(width), r13=114(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 150
LDI r2, 236
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 91
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 330
LDI r11, 83
LDI r12, 84
LDI r13, 114
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
