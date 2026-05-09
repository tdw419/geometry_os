; DESCRIPTION: Composite: Renders a black line between points (197, 204) and (330, 220) then Draws a magenta rectangle at (364, 151) with width 25 and height 81.
; PLAN: r0=197(x1), r1=204(y1), r2=330(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=151(y), r7=25(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 204
LDI r2, 330
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 151
LDI r7, 25
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
