; DESCRIPTION: Composite: Places a cyan 87x114 rectangle at position (215, 35) then Sets a single green pixel at (315, 61) then Draws a yellow line from (97, 233) to (493, 3).
; PLAN: r0=215(x), r1=35(y), r2=87(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=97(x1), r11=233(y1), r12=493(x2), r13=3(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 35
LDI r2, 87
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 97
LDI r11, 233
LDI r12, 493
LDI r13, 3
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
