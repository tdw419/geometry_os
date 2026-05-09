; DESCRIPTION: Places a green circle of radius 27 at center (166, 92).
; PLAN: r0=166(x), r1=92(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 92
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
