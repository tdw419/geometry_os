; DESCRIPTION: Composite: Places a green line segment connecting (232, 4) to (482, 206) then Places a magenta 54x88 rectangle at position (439, 140) then Places a blue dot at position (107, 252).
; PLAN: r0=232(x1), r1=4(y1), r2=482(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=140(y), r7=54(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=252(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 4
LDI r2, 482
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 140
LDI r7, 54
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 252
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
