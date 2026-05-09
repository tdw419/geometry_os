; DESCRIPTION: Composite: Sets a single green pixel at (365, 167) then Places a red 15x60 rectangle at position (427, 4) then Draws a magenta line from (315, 107) to (259, 43).
; PLAN: r0=365(x), r1=167(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=4(y), r7=15(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x1), r11=107(y1), r12=259(x2), r13=43(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 167
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 427
LDI r6, 4
LDI r7, 15
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 107
LDI r12, 259
LDI r13, 43
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
