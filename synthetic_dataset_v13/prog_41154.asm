; DESCRIPTION: Composite: Draws a green rectangle at (16, 59) with width 99 and height 34 then Renders a green line between points (165, 213) and (175, 205) then Sets a single black pixel at (7, 83).
; PLAN: r0=16(x), r1=59(y), r2=99(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x1), r6=213(y1), r7=175(x2), r8=205(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=83(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 59
LDI r2, 99
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 213
LDI r7, 175
LDI r8, 205
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 83
LDI r12, 0x000000
PSET r10, r11, r12
HALT
