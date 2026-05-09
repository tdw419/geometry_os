; DESCRIPTION: Composite: Draws a purple line from (441, 114) to (173, 19) then Places a cyan 93x106 rectangle at position (299, 85) then Places a blue dot at position (354, 175).
; PLAN: r0=441(x1), r1=114(y1), r2=173(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=85(y), r7=93(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=175(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 114
LDI r2, 173
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 85
LDI r7, 93
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 175
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
