; DESCRIPTION: Composite: Places a magenta dot at position (316, 122) then Draws a yellow line from (393, 30) to (156, 166) then Places a cyan circle of radius 79 at center (335, 98).
; PLAN: r0=316(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=393(x1), r6=30(y1), r7=156(x2), r8=166(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=98(y), r12=79(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 30
LDI r7, 156
LDI r8, 166
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 98
LDI r12, 79
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
