; DESCRIPTION: Composite: Draws a magenta line from (485, 23) to (503, 69) then Places a purple dot at position (424, 186).
; PLAN: r0=485(x1), r1=23(y1), r2=503(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=186(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 485
LDI r1, 23
LDI r2, 503
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 186
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
