; DESCRIPTION: Places a purple circle of radius 48 at center (215, 198).
; PLAN: r0=215(x), r1=198(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 198
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
