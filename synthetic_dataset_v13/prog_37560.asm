; DESCRIPTION: Composite: Places a blue line segment connecting (266, 249) to (290, 184) then Draws a green rectangle at (386, 44) with width 60 and height 75 then Sets a single green pixel at (18, 123).
; PLAN: r0=266(x1), r1=249(y1), r2=290(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=44(y), r7=60(width), r8=75(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=18(x), r11=123(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 249
LDI r2, 290
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 44
LDI r7, 60
LDI r8, 75
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 18
LDI r11, 123
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
