; DESCRIPTION: Composite: Renders a yellow box of size 96x114 starting at (41, 108) then Sets a single purple pixel at (428, 227).
; PLAN: r0=41(x), r1=108(y), r2=96(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=227(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 108
LDI r2, 96
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 227
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
