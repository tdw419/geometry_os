; DESCRIPTION: Composite: Draws a white rectangle at (128, 137) with width 90 and height 75 then Places a green line segment connecting (274, 80) to (215, 229).
; PLAN: r0=128(x), r1=137(y), r2=90(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=80(y1), r7=215(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 137
LDI r2, 90
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 80
LDI r7, 215
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
