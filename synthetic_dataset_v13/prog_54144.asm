; DESCRIPTION: Composite: Sets a single red pixel at (439, 83) then Places a white 105x89 rectangle at position (150, 35) then Draws a yellow line from (283, 100) to (184, 166).
; PLAN: r0=439(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=35(y), r7=105(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x1), r11=100(y1), r12=184(x2), r13=166(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 35
LDI r7, 105
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 100
LDI r12, 184
LDI r13, 166
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
