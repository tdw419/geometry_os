; DESCRIPTION: Composite: Renders a green line between points (509, 154) and (437, 64) then Draws a blue rectangle at (278, 103) with width 51 and height 97.
; PLAN: r0=509(x1), r1=154(y1), r2=437(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=103(y), r7=51(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 154
LDI r2, 437
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 103
LDI r7, 51
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
