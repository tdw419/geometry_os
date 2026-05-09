; DESCRIPTION: Composite: Places a red dot at position (69, 30) then Places a orange line segment connecting (158, 40) to (214, 215).
; PLAN: r0=69(x), r1=30(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=40(y1), r7=214(x2), r8=215(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 30
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 158
LDI r6, 40
LDI r7, 214
LDI r8, 215
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
