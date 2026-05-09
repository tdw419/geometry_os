; DESCRIPTION: Composite: Draws a white line from (229, 180) to (385, 192) then Renders a cyan box of size 114x51 starting at (64, 172) then Places a yellow dot at position (265, 52).
; PLAN: r0=229(x1), r1=180(y1), r2=385(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=172(y), r7=114(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=52(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 180
LDI r2, 385
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 172
LDI r7, 114
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 52
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
