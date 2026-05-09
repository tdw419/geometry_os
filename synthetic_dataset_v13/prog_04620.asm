; DESCRIPTION: Composite: Draws a green rectangle at (12, 133) with width 58 and height 17 then Renders a cyan line between points (29, 141) and (73, 213) then Sets a single red pixel at (449, 237).
; PLAN: r0=12(x), r1=133(y), r2=58(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x1), r6=141(y1), r7=73(x2), r8=213(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=449(x), r11=237(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 12
LDI r1, 133
LDI r2, 58
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 141
LDI r7, 73
LDI r8, 213
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 237
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
