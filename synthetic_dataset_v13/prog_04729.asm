; DESCRIPTION: Composite: Renders a yellow line between points (63, 158) and (43, 248) then Renders a yellow box of size 102x103 starting at (299, 23).
; PLAN: r0=63(x1), r1=158(y1), r2=43(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=23(y), r7=102(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 63
LDI r1, 158
LDI r2, 43
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 23
LDI r7, 102
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
