; DESCRIPTION: Composite: Draws a purple rectangle at (218, 151) with width 60 and height 87 then Renders a black line between points (32, 190) and (187, 227) then Sets a single purple pixel at (441, 94).
; PLAN: r0=218(x), r1=151(y), r2=60(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x1), r6=190(y1), r7=187(x2), r8=227(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 151
LDI r2, 60
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 190
LDI r7, 187
LDI r8, 227
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
