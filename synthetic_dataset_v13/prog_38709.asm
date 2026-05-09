; DESCRIPTION: Composite: Draws a purple rectangle at (426, 191) with width 62 and height 59 then Draws a cyan line from (102, 98) to (443, 251) then Places a yellow dot at position (215, 149).
; PLAN: r0=426(x), r1=191(y), r2=62(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x1), r6=98(y1), r7=443(x2), r8=251(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=149(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 191
LDI r2, 62
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 98
LDI r7, 443
LDI r8, 251
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 149
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
