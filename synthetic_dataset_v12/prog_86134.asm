; DESCRIPTION: Composite: Renders a white line between points (218, 151) and (118, 89) then Draws a magenta rectangle at (7, 132) with width 28 and height 97 then Sets a single white pixel at (388, 29).
; PLAN: r0=218(x1), r1=151(y1), r2=118(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=132(y), r7=28(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=29(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 151
LDI r2, 118
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 132
LDI r7, 28
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 29
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
