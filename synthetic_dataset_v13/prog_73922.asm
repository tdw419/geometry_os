; DESCRIPTION: Composite: Creates a purple rectangular region at (274, 143) spanning 26 by 93 pixels then Renders a green line between points (97, 80) and (127, 237) then Places a cyan dot at position (338, 2).
; PLAN: r0=274(x), r1=143(y), r2=26(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x1), r6=80(y1), r7=127(x2), r8=237(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=2(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 143
LDI r2, 26
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 80
LDI r7, 127
LDI r8, 237
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 2
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
