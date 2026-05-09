; DESCRIPTION: Composite: Places a green line segment connecting (429, 120) to (508, 57) then Creates a orange circular shape at (319, 149) with radius 34 then Places a green 99x12 rectangle at position (309, 238).
; PLAN: r0=429(x1), r1=120(y1), r2=508(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=149(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=238(y), r12=99(width), r13=12(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 120
LDI r2, 508
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 149
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 238
LDI r12, 99
LDI r13, 12
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
