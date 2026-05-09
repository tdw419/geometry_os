; DESCRIPTION: Composite: Renders a blue line between points (159, 128) and (301, 12) then Places a yellow circle of radius 35 at center (40, 221).
; PLAN: r0=159(x1), r1=128(y1), r2=301(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=221(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 128
LDI r2, 301
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 221
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
