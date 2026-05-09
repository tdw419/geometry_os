; DESCRIPTION: Places a red circle of radius 15 at center (213, 230).
; PLAN: r0=213(x), r1=230(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 230
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
