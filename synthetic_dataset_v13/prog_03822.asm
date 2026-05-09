; DESCRIPTION: Composite: Renders a green line between points (0, 102) and (415, 35) then Draws a orange rectangle at (253, 16) with width 90 and height 117.
; PLAN: r0=0(x1), r1=102(y1), r2=415(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=16(y), r7=90(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 102
LDI r2, 415
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 16
LDI r7, 90
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
