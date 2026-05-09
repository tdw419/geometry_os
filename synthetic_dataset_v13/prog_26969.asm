; DESCRIPTION: Composite: Draws a green rectangle at (128, 166) with width 100 and height 61 then Places a magenta line segment connecting (377, 192) to (463, 33).
; PLAN: r0=128(x), r1=166(y), r2=100(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x1), r6=192(y1), r7=463(x2), r8=33(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 166
LDI r2, 100
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 192
LDI r7, 463
LDI r8, 33
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
