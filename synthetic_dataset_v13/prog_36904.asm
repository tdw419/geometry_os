; DESCRIPTION: Composite: Draws a red rectangle at (305, 82) with width 19 and height 106 then Draws a purple line from (219, 72) to (176, 36) then Sets a single purple pixel at (503, 250).
; PLAN: r0=305(x), r1=82(y), r2=19(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=72(y1), r7=176(x2), r8=36(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=250(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 82
LDI r2, 19
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 72
LDI r7, 176
LDI r8, 36
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 250
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
