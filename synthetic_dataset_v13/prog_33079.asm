; DESCRIPTION: Composite: Renders a green line between points (221, 152) and (416, 21) then Places a magenta 97x81 rectangle at position (321, 71) then Sets a single orange pixel at (303, 62).
; PLAN: r0=221(x1), r1=152(y1), r2=416(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=71(y), r7=97(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=303(x), r11=62(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 152
LDI r2, 416
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 71
LDI r7, 97
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 62
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
