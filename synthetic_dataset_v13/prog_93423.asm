; DESCRIPTION: Composite: Creates a yellow circular shape at (409, 40) with radius 13 then Draws a red line from (152, 210) to (308, 236) then Renders a white box of size 85x83 starting at (257, 80).
; PLAN: r0=409(x), r1=40(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=210(y1), r7=308(x2), r8=236(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=80(y), r12=85(width), r13=83(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 40
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 210
LDI r7, 308
LDI r8, 236
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 80
LDI r12, 85
LDI r13, 83
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
