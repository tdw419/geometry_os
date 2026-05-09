; DESCRIPTION: Composite: Draws a blue line from (485, 207) to (124, 175) then Sets a single red pixel at (456, 219).
; PLAN: r0=485(x1), r1=207(y1), r2=124(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=219(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 485
LDI r1, 207
LDI r2, 124
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 219
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
