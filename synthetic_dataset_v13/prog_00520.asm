; DESCRIPTION: Composite: Draws a cyan line from (5, 240) to (18, 238) then Draws a black rectangle at (220, 134) with width 19 and height 87 then Sets a single purple pixel at (94, 243).
; PLAN: r0=5(x1), r1=240(y1), r2=18(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=134(y), r7=19(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=243(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 240
LDI r2, 18
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 134
LDI r7, 19
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 243
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
