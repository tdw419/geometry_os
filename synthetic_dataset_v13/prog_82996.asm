; DESCRIPTION: Places a blue circle of radius 48 at center (213, 162).
; PLAN: r0=213(x), r1=162(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 162
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
