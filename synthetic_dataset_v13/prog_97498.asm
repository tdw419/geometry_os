; DESCRIPTION: Composite: Places a purple dot at position (148, 219) then Renders a blue line between points (59, 194) and (359, 49).
; PLAN: r0=148(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=59(x1), r6=194(y1), r7=359(x2), r8=49(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 194
LDI r7, 359
LDI r8, 49
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
