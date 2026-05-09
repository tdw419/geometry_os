; DESCRIPTION: Composite: Draws a orange line from (467, 240) to (262, 137) then Places a magenta dot at position (485, 173) then Places a magenta circle of radius 14 at center (84, 131).
; PLAN: r0=467(x1), r1=240(y1), r2=262(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=485(x), r6=173(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=131(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 240
LDI r2, 262
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 485
LDI r6, 173
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 84
LDI r11, 131
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
