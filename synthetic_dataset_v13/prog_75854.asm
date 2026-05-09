; DESCRIPTION: Composite: Draws a cyan line from (131, 213) to (208, 81) then Renders a green box of size 99x113 starting at (358, 14) then Places a white dot at position (206, 191).
; PLAN: r0=131(x1), r1=213(y1), r2=208(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=14(y), r7=99(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=191(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 213
LDI r2, 208
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 14
LDI r7, 99
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 191
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
