; DESCRIPTION: Composite: Places a magenta line segment connecting (488, 220) to (439, 60) then Places a magenta dot at position (232, 2).
; PLAN: r0=488(x1), r1=220(y1), r2=439(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=2(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 488
LDI r1, 220
LDI r2, 439
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 2
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
