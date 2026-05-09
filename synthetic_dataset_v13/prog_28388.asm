; DESCRIPTION: Composite: Creates a magenta circular shape at (247, 62) with radius 58 then Draws a red line from (402, 251) to (231, 138).
; PLAN: r0=247(x), r1=62(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x1), r6=251(y1), r7=231(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 62
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 251
LDI r7, 231
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
