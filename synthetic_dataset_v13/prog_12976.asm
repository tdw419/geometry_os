; DESCRIPTION: Composite: Places a cyan dot at position (429, 160) then Renders a purple box of size 10x85 starting at (268, 124) then Renders a red line between points (504, 114) and (191, 66).
; PLAN: r0=429(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=124(y), r7=10(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=504(x1), r11=114(y1), r12=191(x2), r13=66(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 124
LDI r7, 10
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 114
LDI r12, 191
LDI r13, 66
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
