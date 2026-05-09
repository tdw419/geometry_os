; DESCRIPTION: Composite: Creates a red rectangular region at (358, 0) spanning 23 by 27 pixels then Places a white line segment connecting (424, 208) to (147, 50).
; PLAN: r0=358(x), r1=0(y), r2=23(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x1), r6=208(y1), r7=147(x2), r8=50(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 0
LDI r2, 23
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 208
LDI r7, 147
LDI r8, 50
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
