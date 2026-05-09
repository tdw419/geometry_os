; DESCRIPTION: Places a red circle of radius 75 at center (400, 144).
; PLAN: r0=400(x), r1=144(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 144
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
