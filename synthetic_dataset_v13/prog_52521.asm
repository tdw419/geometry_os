; DESCRIPTION: Composite: Places a white line segment connecting (139, 92) to (279, 117) then Draws a blue rectangle at (87, 133) with width 46 and height 26 then Places a yellow dot at position (436, 199).
; PLAN: r0=139(x1), r1=92(y1), r2=279(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=133(y), r7=46(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=199(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 92
LDI r2, 279
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 133
LDI r7, 46
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 199
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
