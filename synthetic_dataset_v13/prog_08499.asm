; DESCRIPTION: Composite: Places a magenta dot at position (139, 18) then Places a yellow line segment connecting (438, 67) to (200, 237).
; PLAN: r0=139(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=67(y1), r7=200(x2), r8=237(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 67
LDI r7, 200
LDI r8, 237
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
