; DESCRIPTION: Composite: Renders a cyan box of size 90x88 starting at (411, 46) then Renders a purple line between points (477, 238) and (127, 47) then Sets a single yellow pixel at (420, 128).
; PLAN: r0=411(x), r1=46(y), r2=90(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x1), r6=238(y1), r7=127(x2), r8=47(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=128(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 46
LDI r2, 90
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 238
LDI r7, 127
LDI r8, 47
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 128
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
