; DESCRIPTION: Composite: Renders a magenta box of size 23x57 starting at (42, 177) then Renders a purple line between points (368, 14) and (339, 203).
; PLAN: r0=42(x), r1=177(y), r2=23(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=14(y1), r7=339(x2), r8=203(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 177
LDI r2, 23
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 14
LDI r7, 339
LDI r8, 203
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
