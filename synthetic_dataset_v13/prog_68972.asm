; DESCRIPTION: Composite: Draws a yellow rectangle at (207, 59) with width 30 and height 43 then Renders a yellow line between points (238, 96) and (186, 171).
; PLAN: r0=207(x), r1=59(y), r2=30(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=96(y1), r7=186(x2), r8=171(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 59
LDI r2, 30
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 96
LDI r7, 186
LDI r8, 171
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
