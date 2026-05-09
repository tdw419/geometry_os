; DESCRIPTION: Composite: Draws a cyan line from (460, 241) to (405, 87) then Renders a blue box of size 43x114 starting at (206, 34) then Places a red dot at position (347, 181).
; PLAN: r0=460(x1), r1=241(y1), r2=405(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=34(y), r7=43(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=181(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 241
LDI r2, 405
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 34
LDI r7, 43
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 181
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
