; DESCRIPTION: Composite: Renders a purple line between points (159, 80) and (12, 124) then Places a cyan 38x43 rectangle at position (391, 46) then Draws a white circle centered at (98, 134) with radius 19.
; PLAN: r0=159(x1), r1=80(y1), r2=12(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=46(y), r7=38(width), r8=43(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=134(y), r12=19(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 80
LDI r2, 12
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 46
LDI r7, 38
LDI r8, 43
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 134
LDI r12, 19
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
