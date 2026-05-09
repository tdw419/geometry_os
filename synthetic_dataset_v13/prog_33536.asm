; DESCRIPTION: Composite: Renders a yellow line between points (182, 48) and (469, 247) then Draws a blue rectangle at (183, 81) with width 62 and height 63.
; PLAN: r0=182(x1), r1=48(y1), r2=469(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=81(y), r7=62(width), r8=63(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 48
LDI r2, 469
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 81
LDI r7, 62
LDI r8, 63
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
