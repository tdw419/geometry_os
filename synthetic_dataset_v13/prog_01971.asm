; DESCRIPTION: Composite: Draws a orange line from (502, 17) to (179, 240) then Draws a green rectangle at (74, 202) with width 28 and height 47.
; PLAN: r0=502(x1), r1=17(y1), r2=179(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=202(y), r7=28(width), r8=47(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 17
LDI r2, 179
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 202
LDI r7, 28
LDI r8, 47
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
