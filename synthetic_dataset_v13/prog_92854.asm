; DESCRIPTION: Composite: Places a blue circle of radius 72 at center (89, 133) then Places a yellow dot at position (457, 113).
; PLAN: r0=89(x), r1=133(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=113(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 89
LDI r1, 133
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 113
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
