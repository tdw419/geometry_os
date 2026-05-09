; DESCRIPTION: Composite: Places a cyan 105x114 rectangle at position (62, 70) then Draws a red line from (277, 190) to (219, 67) then Places a magenta dot at position (172, 41).
; PLAN: r0=62(x), r1=70(y), r2=105(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=190(y1), r7=219(x2), r8=67(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=41(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 62
LDI r1, 70
LDI r2, 105
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 190
LDI r7, 219
LDI r8, 67
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 41
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
