; DESCRIPTION: Composite: Places a orange dot at position (396, 84) then Places a purple line segment connecting (481, 192) to (70, 248).
; PLAN: r0=396(x), r1=84(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=481(x1), r6=192(y1), r7=70(x2), r8=248(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 84
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 481
LDI r6, 192
LDI r7, 70
LDI r8, 248
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
