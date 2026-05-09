; DESCRIPTION: Composite: Creates a blue circular shape at (352, 102) with radius 70 then Renders a black line between points (300, 225) and (46, 64).
; PLAN: r0=352(x), r1=102(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=225(y1), r7=46(x2), r8=64(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 102
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 225
LDI r7, 46
LDI r8, 64
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
