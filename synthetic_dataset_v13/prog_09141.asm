; DESCRIPTION: Composite: Places a red dot at position (328, 196) then Places a orange line segment connecting (35, 207) to (261, 137).
; PLAN: r0=328(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=207(y1), r7=261(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 35
LDI r6, 207
LDI r7, 261
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
