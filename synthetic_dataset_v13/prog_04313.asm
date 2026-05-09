; DESCRIPTION: Composite: Renders a green line between points (206, 216) and (343, 222) then Places a purple circle of radius 23 at center (301, 92).
; PLAN: r0=206(x1), r1=216(y1), r2=343(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=92(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 216
LDI r2, 343
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 92
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
