; DESCRIPTION: Places a yellow circle of radius 53 at center (214, 186).
; PLAN: r0=214(x), r1=186(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 186
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
