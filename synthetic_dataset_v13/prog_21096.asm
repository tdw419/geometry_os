; DESCRIPTION: Composite: Places a blue line segment connecting (79, 195) to (175, 80) then Places a green 29x25 rectangle at position (385, 67) then Sets a single green pixel at (136, 63).
; PLAN: r0=79(x1), r1=195(y1), r2=175(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=67(y), r7=29(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=63(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 195
LDI r2, 175
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 67
LDI r7, 29
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 63
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
