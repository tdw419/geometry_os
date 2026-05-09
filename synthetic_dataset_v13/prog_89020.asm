; DESCRIPTION: Places a yellow circle of radius 55 at center (228, 89).
; PLAN: r0=228(x), r1=89(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 89
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
