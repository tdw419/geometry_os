; DESCRIPTION: Composite: Places a magenta dot at position (233, 103) then Renders a purple box of size 37x118 starting at (72, 94) then Renders a yellow line between points (34, 53) and (378, 231).
; PLAN: r0=233(x), r1=103(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=94(y), r7=37(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x1), r11=53(y1), r12=378(x2), r13=231(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 103
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 94
LDI r7, 37
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 53
LDI r12, 378
LDI r13, 231
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
