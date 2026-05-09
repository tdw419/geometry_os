; DESCRIPTION: Places a green circle of radius 64 at center (138, 127).
; PLAN: r0=138(x), r1=127(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 127
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
