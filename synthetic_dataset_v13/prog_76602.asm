; DESCRIPTION: Composite: Places a purple line segment connecting (488, 119) to (215, 5) then Places a red dot at position (465, 175).
; PLAN: r0=488(x1), r1=119(y1), r2=215(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=175(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 488
LDI r1, 119
LDI r2, 215
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 175
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
