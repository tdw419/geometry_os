; DESCRIPTION: Composite: Places a purple 94x79 rectangle at position (127, 96) then Sets a single cyan pixel at (339, 71) then Places a green line segment connecting (70, 92) to (341, 169).
; PLAN: r0=127(x), r1=96(y), r2=94(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=71(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=70(x1), r11=92(y1), r12=341(x2), r13=169(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 96
LDI r2, 94
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 71
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 70
LDI r11, 92
LDI r12, 341
LDI r13, 169
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
