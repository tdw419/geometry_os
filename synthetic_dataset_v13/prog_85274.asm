; DESCRIPTION: Composite: Draws a blue line from (509, 176) to (18, 35) then Places a purple 83x36 rectangle at position (148, 151) then Sets a single magenta pixel at (69, 102).
; PLAN: r0=509(x1), r1=176(y1), r2=18(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=151(y), r7=83(width), r8=36(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=102(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 509
LDI r1, 176
LDI r2, 18
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 151
LDI r7, 83
LDI r8, 36
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 102
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
