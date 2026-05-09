; DESCRIPTION: Composite: Draws a magenta rectangle at (51, 51) with width 103 and height 94 then Draws a magenta line from (75, 212) to (425, 16) then Places a orange dot at position (151, 177).
; PLAN: r0=51(x), r1=51(y), r2=103(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=212(y1), r7=425(x2), r8=16(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=177(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 51
LDI r2, 103
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 212
LDI r7, 425
LDI r8, 16
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 177
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
