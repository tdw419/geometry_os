; DESCRIPTION: Composite: Renders a red line between points (378, 114) and (402, 236) then Renders a magenta box of size 108x69 starting at (98, 140).
; PLAN: r0=378(x1), r1=114(y1), r2=402(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=140(y), r7=108(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 114
LDI r2, 402
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 140
LDI r7, 108
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
