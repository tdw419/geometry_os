; DESCRIPTION: Creates a red circular shape at (216, 230) with radius 23.
; PLAN: r0=216(x), r1=230(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 230
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
