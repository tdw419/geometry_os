; DESCRIPTION: Places a red circle of radius 45 at center (216, 195).
; PLAN: r0=216(x), r1=195(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 195
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
