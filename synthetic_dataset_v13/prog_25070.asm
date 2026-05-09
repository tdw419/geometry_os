; DESCRIPTION: Composite: Places a yellow circle of radius 50 at center (152, 87) then Places a cyan line segment connecting (194, 148) to (46, 65) then Places a purple 59x77 rectangle at position (314, 100).
; PLAN: r0=152(x), r1=87(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=148(y1), r7=46(x2), r8=65(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=100(y), r12=59(width), r13=77(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 87
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 148
LDI r7, 46
LDI r8, 65
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 100
LDI r12, 59
LDI r13, 77
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
