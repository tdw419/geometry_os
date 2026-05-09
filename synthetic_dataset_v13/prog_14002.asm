; DESCRIPTION: Composite: Places a orange 83x63 rectangle at position (49, 98) then Draws a blue line from (180, 45) to (7, 150) then Renders a cyan disk with center (238, 183) and radius 17.
; PLAN: r0=49(x), r1=98(y), r2=83(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x1), r6=45(y1), r7=7(x2), r8=150(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=183(y), r12=17(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 98
LDI r2, 83
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 45
LDI r7, 7
LDI r8, 150
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 183
LDI r12, 17
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
