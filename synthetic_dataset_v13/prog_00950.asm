; DESCRIPTION: Composite: Draws a green rectangle at (355, 193) with width 111 and height 62 then Places a green line segment connecting (108, 15) to (321, 30) then Places a green dot at position (171, 115).
; PLAN: r0=355(x), r1=193(y), r2=111(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=15(y1), r7=321(x2), r8=30(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=115(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 193
LDI r2, 111
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 15
LDI r7, 321
LDI r8, 30
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 115
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
