; DESCRIPTION: Composite: Renders a green line between points (405, 109) and (378, 91) then Renders a blue box of size 35x22 starting at (197, 166).
; PLAN: r0=405(x1), r1=109(y1), r2=378(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=166(y), r7=35(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 109
LDI r2, 378
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 166
LDI r7, 35
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
