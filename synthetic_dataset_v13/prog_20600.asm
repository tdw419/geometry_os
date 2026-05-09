; DESCRIPTION: Composite: Places a green dot at position (25, 191) then Places a purple line segment connecting (59, 191) to (388, 65).
; PLAN: r0=25(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=59(x1), r6=191(y1), r7=388(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 191
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 191
LDI r7, 388
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
