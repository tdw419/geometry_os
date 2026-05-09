; DESCRIPTION: Composite: Draws a blue line from (151, 2) to (489, 219) then Places a magenta dot at position (485, 180).
; PLAN: r0=151(x1), r1=2(y1), r2=489(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=180(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 2
LDI r2, 489
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 180
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
