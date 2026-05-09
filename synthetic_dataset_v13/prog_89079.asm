; DESCRIPTION: Composite: Places a red dot at position (9, 28) then Renders a blue line between points (339, 192) and (509, 7) then Renders a cyan box of size 62x109 starting at (319, 2).
; PLAN: r0=9(x), r1=28(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=192(y1), r7=509(x2), r8=7(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=2(y), r12=62(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 28
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 192
LDI r7, 509
LDI r8, 7
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 2
LDI r12, 62
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
