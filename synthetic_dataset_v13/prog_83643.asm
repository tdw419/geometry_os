; DESCRIPTION: Composite: Places a red line segment connecting (253, 180) to (63, 58) then Draws a orange rectangle at (32, 104) with width 55 and height 100.
; PLAN: r0=253(x1), r1=180(y1), r2=63(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=104(y), r7=55(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 180
LDI r2, 63
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 104
LDI r7, 55
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
