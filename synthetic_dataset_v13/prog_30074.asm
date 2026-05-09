; DESCRIPTION: Composite: Draws a yellow line from (277, 1) to (488, 78) then Sets a single purple pixel at (111, 87).
; PLAN: r0=277(x1), r1=1(y1), r2=488(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=87(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 1
LDI r2, 488
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 87
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
