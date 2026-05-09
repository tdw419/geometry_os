; DESCRIPTION: Composite: Places a blue line segment connecting (106, 199) to (452, 59) then Places a cyan circle of radius 73 at center (356, 115).
; PLAN: r0=106(x1), r1=199(y1), r2=452(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=115(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 199
LDI r2, 452
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 115
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
