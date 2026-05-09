; DESCRIPTION: Composite: Draws a purple line from (69, 190) to (309, 82) then Sets a single red pixel at (209, 97) then Places a cyan circle of radius 21 at center (150, 180).
; PLAN: r0=69(x1), r1=190(y1), r2=309(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=180(y), r12=21(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 190
LDI r2, 309
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 150
LDI r11, 180
LDI r12, 21
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
