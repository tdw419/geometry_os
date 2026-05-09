; DESCRIPTION: Composite: Places a black line segment connecting (287, 64) to (187, 8) then Renders a black box of size 73x118 starting at (85, 127).
; PLAN: r0=287(x1), r1=64(y1), r2=187(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=127(y), r7=73(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 64
LDI r2, 187
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 127
LDI r7, 73
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
