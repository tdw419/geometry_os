; DESCRIPTION: Composite: Renders a green line between points (202, 230) and (103, 214) then Draws a green rectangle at (286, 96) with width 70 and height 50.
; PLAN: r0=202(x1), r1=230(y1), r2=103(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=96(y), r7=70(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 230
LDI r2, 103
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 96
LDI r7, 70
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
