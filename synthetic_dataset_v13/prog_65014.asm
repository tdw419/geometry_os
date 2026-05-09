; DESCRIPTION: Composite: Places a cyan dot at position (186, 107) then Places a blue line segment connecting (493, 119) to (43, 108) then Draws a cyan circle centered at (137, 134) with radius 55.
; PLAN: r0=186(x), r1=107(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=119(y1), r7=43(x2), r8=108(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=134(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 107
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 493
LDI r6, 119
LDI r7, 43
LDI r8, 108
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 134
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
