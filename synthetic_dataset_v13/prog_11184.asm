; DESCRIPTION: Composite: Places a purple 25x34 rectangle at position (264, 79) then Renders a yellow line between points (423, 27) and (299, 194) then Sets a single purple pixel at (17, 232).
; PLAN: r0=264(x), r1=79(y), r2=25(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=27(y1), r7=299(x2), r8=194(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=17(x), r11=232(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 79
LDI r2, 25
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 27
LDI r7, 299
LDI r8, 194
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 232
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
