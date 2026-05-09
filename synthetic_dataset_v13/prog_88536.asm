; DESCRIPTION: Composite: Places a purple 84x71 rectangle at position (289, 82) then Draws a white line from (231, 111) to (319, 140) then Sets a single black pixel at (204, 210).
; PLAN: r0=289(x), r1=82(y), r2=84(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=111(y1), r7=319(x2), r8=140(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=204(x), r11=210(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 82
LDI r2, 84
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 111
LDI r7, 319
LDI r8, 140
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 210
LDI r12, 0x000000
PSET r10, r11, r12
HALT
