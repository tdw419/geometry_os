; DESCRIPTION: Composite: Renders a blue line between points (127, 243) and (430, 101) then Sets a single orange pixel at (196, 214).
; PLAN: r0=127(x1), r1=243(y1), r2=430(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=214(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 243
LDI r2, 430
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 214
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
