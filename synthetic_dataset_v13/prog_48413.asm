; DESCRIPTION: Composite: Sets a single white pixel at (101, 219) then Places a blue line segment connecting (385, 254) to (274, 71).
; PLAN: r0=101(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=254(y1), r7=274(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 254
LDI r7, 274
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
