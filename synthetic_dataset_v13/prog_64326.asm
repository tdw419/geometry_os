; DESCRIPTION: Composite: Sets a single orange pixel at (82, 251) then Draws a cyan line from (453, 87) to (106, 6) then Places a magenta 62x71 rectangle at position (204, 25).
; PLAN: r0=82(x), r1=251(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=453(x1), r6=87(y1), r7=106(x2), r8=6(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=204(x), r11=25(y), r12=62(width), r13=71(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 251
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 453
LDI r6, 87
LDI r7, 106
LDI r8, 6
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 25
LDI r12, 62
LDI r13, 71
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
