; DESCRIPTION: Composite: Draws a cyan rectangle at (104, 162) with width 117 and height 39 then Renders a blue line between points (167, 144) and (321, 24).
; PLAN: r0=104(x), r1=162(y), r2=117(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=144(y1), r7=321(x2), r8=24(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 162
LDI r2, 117
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 144
LDI r7, 321
LDI r8, 24
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
