; DESCRIPTION: Composite: Renders a white line between points (337, 204) and (257, 186) then Draws a magenta rectangle at (165, 46) with width 88 and height 84 then Sets a single purple pixel at (255, 39).
; PLAN: r0=337(x1), r1=204(y1), r2=257(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=46(y), r7=88(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=39(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 204
LDI r2, 257
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 46
LDI r7, 88
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 39
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
