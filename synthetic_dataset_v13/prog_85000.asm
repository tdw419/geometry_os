; DESCRIPTION: Composite: Places a black dot at position (238, 162) then Draws a purple line from (69, 49) to (485, 8).
; PLAN: r0=238(x), r1=162(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=49(y1), r7=485(x2), r8=8(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 162
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 69
LDI r6, 49
LDI r7, 485
LDI r8, 8
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
