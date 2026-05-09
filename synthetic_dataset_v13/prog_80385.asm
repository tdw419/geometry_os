; DESCRIPTION: Composite: Draws a magenta rectangle at (280, 178) with width 102 and height 53 then Renders a green line between points (90, 198) and (247, 240).
; PLAN: r0=280(x), r1=178(y), r2=102(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x1), r6=198(y1), r7=247(x2), r8=240(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 178
LDI r2, 102
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 198
LDI r7, 247
LDI r8, 240
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
