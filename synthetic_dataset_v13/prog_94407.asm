; DESCRIPTION: Places a red circle of radius 67 at center (215, 159).
; PLAN: r0=215(x), r1=159(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 159
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
