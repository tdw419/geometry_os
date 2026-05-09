; DESCRIPTION: Places a red circle of radius 32 at center (367, 210).
; PLAN: r0=367(x), r1=210(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 210
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
