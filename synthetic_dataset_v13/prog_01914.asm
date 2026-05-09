; DESCRIPTION: Composite: Draws a black rectangle at (278, 51) with width 46 and height 77 then Renders a red line between points (176, 43) and (227, 39) then Sets a single cyan pixel at (320, 14).
; PLAN: r0=278(x), r1=51(y), r2=46(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x1), r6=43(y1), r7=227(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=14(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 278
LDI r1, 51
LDI r2, 46
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 43
LDI r7, 227
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 14
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
