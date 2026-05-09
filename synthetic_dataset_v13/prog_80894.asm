; DESCRIPTION: Composite: Places a red line segment connecting (378, 23) to (246, 92) then Renders a cyan box of size 20x37 starting at (332, 117).
; PLAN: r0=378(x1), r1=23(y1), r2=246(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=117(y), r7=20(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 23
LDI r2, 246
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 117
LDI r7, 20
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
