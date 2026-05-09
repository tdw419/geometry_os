; DESCRIPTION: Composite: Draws a black rectangle at (4, 103) with width 71 and height 103 then Renders a green line between points (424, 86) and (319, 10).
; PLAN: r0=4(x), r1=103(y), r2=71(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x1), r6=86(y1), r7=319(x2), r8=10(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 103
LDI r2, 71
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 86
LDI r7, 319
LDI r8, 10
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
