; DESCRIPTION: Composite: Places a purple 53x53 rectangle at position (72, 139) then Draws a green line from (421, 114) to (241, 155) then Places a green dot at position (82, 240).
; PLAN: r0=72(x), r1=139(y), r2=53(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x1), r6=114(y1), r7=241(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=240(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 139
LDI r2, 53
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 114
LDI r7, 241
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 240
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
