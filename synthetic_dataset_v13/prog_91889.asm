; DESCRIPTION: Composite: Draws a white rectangle at (105, 201) with width 81 and height 47 then Renders a yellow line between points (415, 25) and (239, 68).
; PLAN: r0=105(x), r1=201(y), r2=81(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=25(y1), r7=239(x2), r8=68(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 201
LDI r2, 81
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 25
LDI r7, 239
LDI r8, 68
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
