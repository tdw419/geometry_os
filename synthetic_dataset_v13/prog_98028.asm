; DESCRIPTION: Composite: Sets a single green pixel at (168, 212) then Places a red line segment connecting (329, 117) to (347, 18) then Draws a green rectangle at (50, 54) with width 64 and height 70.
; PLAN: r0=168(x), r1=212(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=329(x1), r6=117(y1), r7=347(x2), r8=18(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=54(y), r12=64(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 212
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 329
LDI r6, 117
LDI r7, 347
LDI r8, 18
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 54
LDI r12, 64
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
