; DESCRIPTION: Composite: Draws a green line from (7, 202) to (260, 172) then Draws a cyan rectangle at (3, 213) with width 72 and height 40 then Places a green dot at position (216, 71).
; PLAN: r0=7(x1), r1=202(y1), r2=260(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=213(y), r7=72(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=71(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 7
LDI r1, 202
LDI r2, 260
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 213
LDI r7, 72
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 71
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
