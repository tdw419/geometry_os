; DESCRIPTION: Composite: Draws a purple line from (429, 143) to (280, 111) then Places a blue 80x70 rectangle at position (359, 141) then Sets a single orange pixel at (499, 65).
; PLAN: r0=429(x1), r1=143(y1), r2=280(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=141(y), r7=80(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=499(x), r11=65(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 143
LDI r2, 280
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 141
LDI r7, 80
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 65
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
