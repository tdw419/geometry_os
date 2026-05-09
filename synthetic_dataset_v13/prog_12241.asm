; DESCRIPTION: Places a blue circle of radius 23 at center (305, 182).
; PLAN: r0=305(x), r1=182(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 182
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
