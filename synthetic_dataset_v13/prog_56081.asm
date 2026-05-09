; DESCRIPTION: Composite: Places a white circle of radius 25 at center (464, 98) then Renders a green line between points (116, 69) and (13, 100) then Places a black 84x25 rectangle at position (77, 104).
; PLAN: r0=464(x), r1=98(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x1), r6=69(y1), r7=13(x2), r8=100(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=104(y), r12=84(width), r13=25(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 98
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 69
LDI r7, 13
LDI r8, 100
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 104
LDI r12, 84
LDI r13, 25
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
