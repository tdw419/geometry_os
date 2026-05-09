; DESCRIPTION: Composite: Sets a single blue pixel at (356, 231) then Places a cyan line segment connecting (67, 165) to (496, 92).
; PLAN: r0=356(x), r1=231(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=67(x1), r6=165(y1), r7=496(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 231
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 165
LDI r7, 496
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
