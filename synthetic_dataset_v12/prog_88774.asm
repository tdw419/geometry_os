; DESCRIPTION: Places a yellow circle of radius 52 at center (225, 95).
; PLAN: r0=225(x), r1=95(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 95
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
