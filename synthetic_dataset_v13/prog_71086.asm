; DESCRIPTION: Places a yellow circle of radius 42 at center (352, 75).
; PLAN: r0=352(x), r1=75(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 75
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
