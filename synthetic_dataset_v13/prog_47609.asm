; DESCRIPTION: Places a red circle of radius 51 at center (350, 52).
; PLAN: r0=350(x), r1=52(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 52
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
