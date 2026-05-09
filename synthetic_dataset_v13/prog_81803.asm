; DESCRIPTION: Composite: Places a magenta dot at position (343, 173) then Places a white line segment connecting (352, 208) to (170, 47).
; PLAN: r0=343(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=352(x1), r6=208(y1), r7=170(x2), r8=47(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 208
LDI r7, 170
LDI r8, 47
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
