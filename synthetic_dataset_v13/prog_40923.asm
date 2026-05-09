; DESCRIPTION: Composite: Renders a green box of size 92x93 starting at (39, 106) then Places a purple dot at position (287, 81) then Places a black line segment connecting (190, 133) to (452, 210).
; PLAN: r0=39(x), r1=106(y), r2=92(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=81(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=190(x1), r11=133(y1), r12=452(x2), r13=210(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 106
LDI r2, 92
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 81
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 190
LDI r11, 133
LDI r12, 452
LDI r13, 210
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
