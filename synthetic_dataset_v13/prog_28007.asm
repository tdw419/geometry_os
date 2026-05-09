; DESCRIPTION: Composite: Places a green dot at position (205, 208) then Renders a green box of size 74x15 starting at (392, 23) then Places a red line segment connecting (466, 151) to (41, 7).
; PLAN: r0=205(x), r1=208(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=23(y), r7=74(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x1), r11=151(y1), r12=41(x2), r13=7(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 208
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 392
LDI r6, 23
LDI r7, 74
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 151
LDI r12, 41
LDI r13, 7
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
