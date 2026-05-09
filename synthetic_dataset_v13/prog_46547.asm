; DESCRIPTION: Composite: Draws a purple line from (449, 174) to (170, 141) then Draws a cyan circle centered at (263, 78) with radius 51.
; PLAN: r0=449(x1), r1=174(y1), r2=170(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=78(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 174
LDI r2, 170
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 78
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
