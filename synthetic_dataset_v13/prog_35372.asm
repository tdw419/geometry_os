; DESCRIPTION: Places a yellow circle of radius 74 at center (167, 89).
; PLAN: r0=167(x), r1=89(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 89
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
