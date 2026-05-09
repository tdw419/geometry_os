; DESCRIPTION: Composite: Creates a orange circular shape at (127, 186) with radius 67 then Renders a yellow line between points (42, 246) and (414, 254).
; PLAN: r0=127(x), r1=186(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x1), r6=246(y1), r7=414(x2), r8=254(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 186
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 246
LDI r7, 414
LDI r8, 254
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
