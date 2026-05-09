; DESCRIPTION: Composite: Places a black dot at position (254, 35) then Draws a cyan line from (468, 191) to (8, 84).
; PLAN: r0=254(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=191(y1), r7=8(x2), r8=84(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 468
LDI r6, 191
LDI r7, 8
LDI r8, 84
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
