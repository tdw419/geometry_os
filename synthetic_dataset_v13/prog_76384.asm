; DESCRIPTION: Composite: Draws a orange line from (385, 135) to (135, 84) then Places a blue 53x14 rectangle at position (406, 107) then Places a yellow dot at position (22, 10).
; PLAN: r0=385(x1), r1=135(y1), r2=135(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=107(y), r7=53(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x), r11=10(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 135
LDI r2, 135
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 107
LDI r7, 53
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 10
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
