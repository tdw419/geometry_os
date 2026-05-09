; DESCRIPTION: Composite: Places a green line segment connecting (129, 147) to (81, 182) then Renders a orange box of size 62x101 starting at (54, 90).
; PLAN: r0=129(x1), r1=147(y1), r2=81(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=90(y), r7=62(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 147
LDI r2, 81
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 90
LDI r7, 62
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
