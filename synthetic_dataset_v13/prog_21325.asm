; DESCRIPTION: Composite: Renders a cyan box of size 70x85 starting at (273, 52) then Creates a yellow circular shape at (219, 159) with radius 24 then Renders a magenta line between points (409, 55) and (166, 202).
; PLAN: r0=273(x), r1=52(y), r2=70(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=159(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x1), r11=55(y1), r12=166(x2), r13=202(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 52
LDI r2, 70
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 159
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 55
LDI r12, 166
LDI r13, 202
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
