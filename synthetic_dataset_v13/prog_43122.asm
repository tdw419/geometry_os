; DESCRIPTION: Places a yellow circle of radius 42 at center (115, 52).
; PLAN: r0=115(x), r1=52(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 52
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
