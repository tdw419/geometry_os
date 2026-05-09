; DESCRIPTION: Composite: Draws a white line from (397, 190) to (388, 186) then Draws a green rectangle at (367, 72) with width 82 and height 19 then Sets a single purple pixel at (296, 141).
; PLAN: r0=397(x1), r1=190(y1), r2=388(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=72(y), r7=82(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=141(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 397
LDI r1, 190
LDI r2, 388
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 72
LDI r7, 82
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 141
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
