; DESCRIPTION: Composite: Creates a yellow circular shape at (120, 54) with radius 52 then Creates a orange rectangular region at (234, 33) spanning 30 by 25 pixels then Places a cyan line segment connecting (302, 12) to (422, 132).
; PLAN: r0=120(x), r1=54(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=33(y), r7=30(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x1), r11=12(y1), r12=422(x2), r13=132(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 54
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 33
LDI r7, 30
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 12
LDI r12, 422
LDI r13, 132
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
