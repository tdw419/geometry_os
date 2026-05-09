; DESCRIPTION: Composite: Draws a yellow rectangle at (360, 98) with width 117 and height 47 then Renders a black line between points (452, 113) and (332, 213).
; PLAN: r0=360(x), r1=98(y), r2=117(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x1), r6=113(y1), r7=332(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 98
LDI r2, 117
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 113
LDI r7, 332
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
