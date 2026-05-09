; DESCRIPTION: Composite: Places a blue 69x55 rectangle at position (46, 92) then Draws a white line from (6, 161) to (4, 58) then Places a green dot at position (147, 211).
; PLAN: r0=46(x), r1=92(y), r2=69(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x1), r6=161(y1), r7=4(x2), r8=58(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=147(x), r11=211(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 92
LDI r2, 69
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 161
LDI r7, 4
LDI r8, 58
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 211
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
