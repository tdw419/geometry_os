; DESCRIPTION: Composite: Draws a blue line from (349, 114) to (106, 36) then Sets a single purple pixel at (124, 0) then Places a cyan 69x91 rectangle at position (436, 63).
; PLAN: r0=349(x1), r1=114(y1), r2=106(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=0(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=436(x), r11=63(y), r12=69(width), r13=91(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 114
LDI r2, 106
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 0
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 436
LDI r11, 63
LDI r12, 69
LDI r13, 91
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
