; DESCRIPTION: Composite: Places a green line segment connecting (65, 54) to (261, 208) then Draws a green rectangle at (59, 164) with width 71 and height 66.
; PLAN: r0=65(x1), r1=54(y1), r2=261(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=164(y), r7=71(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 54
LDI r2, 261
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 164
LDI r7, 71
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
