; DESCRIPTION: Composite: Draws a yellow rectangle at (305, 53) with width 117 and height 107 then Renders a yellow line between points (88, 77) and (437, 182) then Sets a single purple pixel at (352, 94).
; PLAN: r0=305(x), r1=53(y), r2=117(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x1), r6=77(y1), r7=437(x2), r8=182(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 53
LDI r2, 117
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 77
LDI r7, 437
LDI r8, 182
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
