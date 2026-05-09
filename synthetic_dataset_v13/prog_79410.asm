; DESCRIPTION: Composite: Draws a magenta rectangle at (184, 122) with width 48 and height 63 then Renders a cyan line between points (183, 146) and (326, 13).
; PLAN: r0=184(x), r1=122(y), r2=48(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x1), r6=146(y1), r7=326(x2), r8=13(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 122
LDI r2, 48
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 146
LDI r7, 326
LDI r8, 13
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
