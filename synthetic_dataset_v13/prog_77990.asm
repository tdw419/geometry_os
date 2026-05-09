; DESCRIPTION: Composite: Draws a purple line from (76, 214) to (310, 108) then Places a black circle of radius 34 at center (426, 139).
; PLAN: r0=76(x1), r1=214(y1), r2=310(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=139(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 214
LDI r2, 310
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 139
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
