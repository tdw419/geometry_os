; DESCRIPTION: Places a blue circle of radius 10 at center (352, 209).
; PLAN: r0=352(x), r1=209(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 209
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
