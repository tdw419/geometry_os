; DESCRIPTION: Composite: Creates a green circular shape at (305, 185) with radius 70 then Places a orange 60x40 rectangle at position (224, 121) then Places a red line segment connecting (439, 255) to (500, 156).
; PLAN: r0=305(x), r1=185(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x), r6=121(y), r7=60(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x1), r11=255(y1), r12=500(x2), r13=156(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 185
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 121
LDI r7, 60
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 255
LDI r12, 500
LDI r13, 156
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
