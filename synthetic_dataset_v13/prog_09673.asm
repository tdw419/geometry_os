; DESCRIPTION: Composite: Creates a magenta circular shape at (262, 178) with radius 37 then Renders a cyan box of size 11x31 starting at (208, 85) then Places a white line segment connecting (181, 223) to (62, 43).
; PLAN: r0=262(x), r1=178(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=85(y), r7=11(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x1), r11=223(y1), r12=62(x2), r13=43(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 178
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 85
LDI r7, 11
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 223
LDI r12, 62
LDI r13, 43
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
