; DESCRIPTION: Composite: Places a green dot at position (187, 89) then Renders a green box of size 115x109 starting at (26, 21) then Renders a cyan line between points (137, 72) and (136, 218).
; PLAN: r0=187(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=21(y), r7=115(width), r8=109(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x1), r11=72(y1), r12=136(x2), r13=218(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 89
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 26
LDI r6, 21
LDI r7, 115
LDI r8, 109
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 72
LDI r12, 136
LDI r13, 218
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
