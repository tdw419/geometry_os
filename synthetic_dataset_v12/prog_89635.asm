; DESCRIPTION: Composite: Places a red line segment connecting (72, 149) to (223, 67) then Places a red 76x115 rectangle at position (371, 8) then Places a white circle of radius 14 at center (156, 97).
; PLAN: r0=72(x1), r1=149(y1), r2=223(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=8(y), r7=76(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=97(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 149
LDI r2, 223
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 8
LDI r7, 76
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 97
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
