; DESCRIPTION: Composite: Draws a blue rectangle at (286, 80) with width 31 and height 26 then Renders a yellow line between points (15, 190) and (144, 218) then Places a black dot at position (464, 42).
; PLAN: r0=286(x), r1=80(y), r2=31(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=190(y1), r7=144(x2), r8=218(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=464(x), r11=42(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 80
LDI r2, 31
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 190
LDI r7, 144
LDI r8, 218
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 42
LDI r12, 0x000000
PSET r10, r11, r12
HALT
