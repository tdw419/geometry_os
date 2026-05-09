; DESCRIPTION: Composite: Renders a cyan disk with center (445, 121) and radius 41 then Draws a purple rectangle at (71, 199) with width 26 and height 41 then Draws a black line from (479, 251) to (84, 242).
; PLAN: r0=445(x), r1=121(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=199(y), r7=26(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x1), r11=251(y1), r12=84(x2), r13=242(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 121
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 199
LDI r7, 26
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 251
LDI r12, 84
LDI r13, 242
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
