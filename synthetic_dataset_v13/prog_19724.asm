; DESCRIPTION: Composite: Draws a orange circle centered at (330, 160) with radius 79 then Draws a blue rectangle at (34, 166) with width 87 and height 42.
; PLAN: r0=330(x), r1=160(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=166(y), r7=87(width), r8=42(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 160
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 166
LDI r7, 87
LDI r8, 42
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
