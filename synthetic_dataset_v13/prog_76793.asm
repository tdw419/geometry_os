; DESCRIPTION: Composite: Creates a magenta rectangular region at (18, 147) spanning 44 by 36 pixels then Places a white line segment connecting (204, 150) to (28, 223).
; PLAN: r0=18(x), r1=147(y), r2=44(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x1), r6=150(y1), r7=28(x2), r8=223(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 147
LDI r2, 44
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 150
LDI r7, 28
LDI r8, 223
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
