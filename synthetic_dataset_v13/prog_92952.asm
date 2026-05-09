; DESCRIPTION: Places a red circle of radius 60 at center (110, 127).
; PLAN: r0=110(x), r1=127(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 127
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
