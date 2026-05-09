; DESCRIPTION: Composite: Creates a magenta rectangular region at (26, 99) spanning 99 by 57 pixels then Draws a magenta line from (405, 59) to (257, 104) then Places a green dot at position (183, 62).
; PLAN: r0=26(x), r1=99(y), r2=99(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x1), r6=59(y1), r7=257(x2), r8=104(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=62(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 99
LDI r2, 99
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 59
LDI r7, 257
LDI r8, 104
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 62
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
