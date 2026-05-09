; DESCRIPTION: Composite: Renders a cyan box of size 40x40 starting at (57, 109) then Draws a yellow circle centered at (34, 216) with radius 27 then Places a green line segment connecting (359, 94) to (402, 42).
; PLAN: r0=57(x), r1=109(y), r2=40(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x), r6=216(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x1), r11=94(y1), r12=402(x2), r13=42(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 109
LDI r2, 40
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 216
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 94
LDI r12, 402
LDI r13, 42
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
