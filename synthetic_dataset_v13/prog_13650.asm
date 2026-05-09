; DESCRIPTION: Places a red circle of radius 29 at center (482, 183).
; PLAN: r0=482(x), r1=183(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 183
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
