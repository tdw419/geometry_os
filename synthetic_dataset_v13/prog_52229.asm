; DESCRIPTION: Composite: Creates a magenta rectangular region at (328, 32) spanning 23 by 88 pixels then Places a cyan line segment connecting (349, 177) to (350, 204) then Creates a red circular shape at (416, 119) with radius 75.
; PLAN: r0=328(x), r1=32(y), r2=23(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=177(y1), r7=350(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=119(y), r12=75(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 32
LDI r2, 23
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 177
LDI r7, 350
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 119
LDI r12, 75
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
