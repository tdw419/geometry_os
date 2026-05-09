; DESCRIPTION: Composite: Places a black line segment connecting (111, 193) to (460, 243) then Places a blue dot at position (449, 71) then Renders a red box of size 75x72 starting at (378, 179).
; PLAN: r0=111(x1), r1=193(y1), r2=460(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=71(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=179(y), r12=75(width), r13=72(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 193
LDI r2, 460
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 71
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 378
LDI r11, 179
LDI r12, 75
LDI r13, 72
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
