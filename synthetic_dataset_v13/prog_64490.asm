; DESCRIPTION: Composite: Draws a blue line from (165, 229) to (131, 203) then Places a green 79x102 rectangle at position (225, 107) then Sets a single magenta pixel at (391, 26).
; PLAN: r0=165(x1), r1=229(y1), r2=131(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=107(y), r7=79(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x), r11=26(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 229
LDI r2, 131
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 107
LDI r7, 79
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 26
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
