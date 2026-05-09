; DESCRIPTION: Composite: Renders a blue line between points (310, 106) and (255, 222) then Draws a cyan rectangle at (302, 40) with width 48 and height 38.
; PLAN: r0=310(x1), r1=106(y1), r2=255(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=40(y), r7=48(width), r8=38(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 106
LDI r2, 255
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 40
LDI r7, 48
LDI r8, 38
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
