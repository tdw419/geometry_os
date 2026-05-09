; DESCRIPTION: Places a red circle of radius 75 at center (237, 127).
; PLAN: r0=237(x), r1=127(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 127
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
