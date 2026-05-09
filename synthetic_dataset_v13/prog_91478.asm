; DESCRIPTION: Places a green circle of radius 51 at center (187, 90).
; PLAN: r0=187(x), r1=90(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 90
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
