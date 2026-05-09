; DESCRIPTION: Composite: Places a black line segment connecting (306, 90) to (355, 252) then Places a magenta 63x51 rectangle at position (83, 134).
; PLAN: r0=306(x1), r1=90(y1), r2=355(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=134(y), r7=63(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 90
LDI r2, 355
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 134
LDI r7, 63
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
