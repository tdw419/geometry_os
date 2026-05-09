; DESCRIPTION: Composite: Creates a cyan rectangular region at (122, 43) spanning 105 by 86 pixels then Draws a red line from (387, 25) to (279, 155) then Places a white dot at position (85, 180).
; PLAN: r0=122(x), r1=43(y), r2=105(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=25(y1), r7=279(x2), r8=155(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=180(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 43
LDI r2, 105
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 25
LDI r7, 279
LDI r8, 155
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 180
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
