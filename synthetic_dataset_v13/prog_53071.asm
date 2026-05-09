; DESCRIPTION: Places a yellow circle of radius 38 at center (214, 144).
; PLAN: r0=214(x), r1=144(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 144
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
