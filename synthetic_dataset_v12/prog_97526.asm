; DESCRIPTION: Composite: Renders a white line between points (322, 221) and (372, 87) then Draws a orange rectangle at (26, 135) with width 104 and height 40.
; PLAN: r0=322(x1), r1=221(y1), r2=372(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=135(y), r7=104(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 221
LDI r2, 372
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 135
LDI r7, 104
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
