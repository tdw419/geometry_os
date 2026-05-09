; DESCRIPTION: Places a red circle of radius 40 at center (230, 65).
; PLAN: r0=230(x), r1=65(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 65
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
