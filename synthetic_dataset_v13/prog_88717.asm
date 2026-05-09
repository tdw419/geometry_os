; DESCRIPTION: Composite: Places a yellow dot at position (329, 101) then Places a blue circle of radius 59 at center (420, 89).
; PLAN: r0=329(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=89(y), r7=59(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 420
LDI r6, 89
LDI r7, 59
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
