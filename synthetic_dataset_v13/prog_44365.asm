; DESCRIPTION: Composite: Places a cyan dot at position (118, 224) then Renders a purple line between points (423, 148) and (339, 126) then Places a magenta 29x56 rectangle at position (31, 193).
; PLAN: r0=118(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=423(x1), r6=148(y1), r7=339(x2), r8=126(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=31(x), r11=193(y), r12=29(width), r13=56(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 423
LDI r6, 148
LDI r7, 339
LDI r8, 126
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 193
LDI r12, 29
LDI r13, 56
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
