; DESCRIPTION: Places a green circle of radius 10 at center (158, 27).
; PLAN: r0=158(x), r1=27(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 27
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
