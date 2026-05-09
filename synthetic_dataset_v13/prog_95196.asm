; DESCRIPTION: Composite: Draws a orange line from (509, 150) to (414, 83) then Places a white 26x36 rectangle at position (95, 141).
; PLAN: r0=509(x1), r1=150(y1), r2=414(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=141(y), r7=26(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 150
LDI r2, 414
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 141
LDI r7, 26
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
