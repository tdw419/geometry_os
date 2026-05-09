; DESCRIPTION: Composite: Places a black line segment connecting (393, 209) to (78, 206) then Sets a single yellow pixel at (446, 195) then Draws a green rectangle at (82, 151) with width 111 and height 55.
; PLAN: r0=393(x1), r1=209(y1), r2=78(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=195(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=82(x), r11=151(y), r12=111(width), r13=55(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 209
LDI r2, 78
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 195
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 82
LDI r11, 151
LDI r12, 111
LDI r13, 55
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
