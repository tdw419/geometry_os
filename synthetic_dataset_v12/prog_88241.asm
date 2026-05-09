; DESCRIPTION: Composite: Renders a black line between points (4, 216) and (364, 97) then Places a purple circle of radius 64 at center (74, 180).
; PLAN: r0=4(x1), r1=216(y1), r2=364(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=180(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 216
LDI r2, 364
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 180
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
