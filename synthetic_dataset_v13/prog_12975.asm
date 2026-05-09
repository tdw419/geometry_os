; DESCRIPTION: Composite: Creates a orange circular shape at (409, 211) with radius 34 then Places a yellow 22x50 rectangle at position (202, 93) then Renders a orange line between points (181, 123) and (93, 38).
; PLAN: r0=409(x), r1=211(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=93(y), r7=22(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x1), r11=123(y1), r12=93(x2), r13=38(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 211
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 93
LDI r7, 22
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 123
LDI r12, 93
LDI r13, 38
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
