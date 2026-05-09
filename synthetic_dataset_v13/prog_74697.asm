; DESCRIPTION: Composite: Places a green 71x106 rectangle at position (205, 8) then Renders a yellow line between points (224, 15) and (385, 14) then Sets a single white pixel at (349, 90).
; PLAN: r0=205(x), r1=8(y), r2=71(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=15(y1), r7=385(x2), r8=14(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=349(x), r11=90(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 8
LDI r2, 71
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 15
LDI r7, 385
LDI r8, 14
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 90
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
