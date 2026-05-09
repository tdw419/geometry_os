; DESCRIPTION: Composite: Places a yellow dot at position (500, 138) then Places a magenta line segment connecting (339, 89) to (384, 118) then Draws a white rectangle at (98, 168) with width 90 and height 72.
; PLAN: r0=500(x), r1=138(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=89(y1), r7=384(x2), r8=118(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=168(y), r12=90(width), r13=72(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 138
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 339
LDI r6, 89
LDI r7, 384
LDI r8, 118
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 168
LDI r12, 90
LDI r13, 72
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
