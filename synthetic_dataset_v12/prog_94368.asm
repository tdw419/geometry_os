; DESCRIPTION: Composite: Draws a magenta rectangle at (248, 59) with width 42 and height 78 then Places a white line segment connecting (120, 38) to (52, 199).
; PLAN: r0=248(x), r1=59(y), r2=42(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=38(y1), r7=52(x2), r8=199(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 59
LDI r2, 42
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 38
LDI r7, 52
LDI r8, 199
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
