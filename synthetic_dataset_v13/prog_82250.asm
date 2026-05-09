; DESCRIPTION: Composite: Draws a magenta line from (264, 49) to (451, 112) then Renders a white box of size 12x93 starting at (278, 81) then Sets a single cyan pixel at (372, 132).
; PLAN: r0=264(x1), r1=49(y1), r2=451(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=81(y), r7=12(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x), r11=132(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 49
LDI r2, 451
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 81
LDI r7, 12
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 132
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
