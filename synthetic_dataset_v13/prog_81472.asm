; DESCRIPTION: Composite: Draws a black line from (181, 193) to (280, 127) then Creates a purple rectangular region at (455, 93) spanning 36 by 24 pixels then Places a yellow dot at position (467, 197).
; PLAN: r0=181(x1), r1=193(y1), r2=280(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=93(y), r7=36(width), r8=24(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x), r11=197(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 193
LDI r2, 280
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 93
LDI r7, 36
LDI r8, 24
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 197
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
