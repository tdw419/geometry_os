; DESCRIPTION: Composite: Draws a red line from (72, 67) to (51, 39) then Places a red 98x89 rectangle at position (255, 151) then Places a red dot at position (158, 55).
; PLAN: r0=72(x1), r1=67(y1), r2=51(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=151(y), r7=98(width), r8=89(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=55(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 67
LDI r2, 51
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 151
LDI r7, 98
LDI r8, 89
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 55
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
