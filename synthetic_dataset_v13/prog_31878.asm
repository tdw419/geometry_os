; DESCRIPTION: Composite: Renders a green line between points (318, 58) and (248, 220) then Draws a yellow rectangle at (420, 59) with width 23 and height 39.
; PLAN: r0=318(x1), r1=58(y1), r2=248(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=59(y), r7=23(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 58
LDI r2, 248
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 59
LDI r7, 23
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
