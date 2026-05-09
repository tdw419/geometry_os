; DESCRIPTION: Composite: Draws a magenta rectangle at (46, 80) with width 85 and height 61 then Places a green dot at position (434, 74) then Places a blue line segment connecting (126, 172) to (342, 178).
; PLAN: r0=46(x), r1=80(y), r2=85(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=74(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=126(x1), r11=172(y1), r12=342(x2), r13=178(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 80
LDI r2, 85
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 74
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 126
LDI r11, 172
LDI r12, 342
LDI r13, 178
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
