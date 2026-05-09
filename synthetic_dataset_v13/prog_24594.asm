; DESCRIPTION: Places a green circle of radius 36 at center (82, 162).
; PLAN: r0=82(x), r1=162(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 162
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
