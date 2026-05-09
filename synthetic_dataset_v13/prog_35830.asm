; DESCRIPTION: Composite: Creates a green circular shape at (94, 95) with radius 50 then Draws a cyan rectangle at (265, 23) with width 93 and height 53 then Places a cyan line segment connecting (281, 30) to (404, 119).
; PLAN: r0=94(x), r1=95(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=23(y), r7=93(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x1), r11=30(y1), r12=404(x2), r13=119(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 95
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 23
LDI r7, 93
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 30
LDI r12, 404
LDI r13, 119
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
