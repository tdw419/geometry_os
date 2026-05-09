; DESCRIPTION: Composite: Draws a cyan rectangle at (204, 1) with width 63 and height 68 then Places a magenta line segment connecting (297, 125) to (4, 181) then Places a cyan dot at position (508, 215).
; PLAN: r0=204(x), r1=1(y), r2=63(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x1), r6=125(y1), r7=4(x2), r8=181(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=215(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 1
LDI r2, 63
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 125
LDI r7, 4
LDI r8, 181
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 215
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
