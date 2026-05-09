; DESCRIPTION: Composite: Renders a green line between points (362, 191) and (138, 86) then Draws a cyan rectangle at (237, 46) with width 92 and height 107 then Sets a single blue pixel at (184, 85).
; PLAN: r0=362(x1), r1=191(y1), r2=138(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=46(y), r7=92(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=85(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 191
LDI r2, 138
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 46
LDI r7, 92
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 85
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
