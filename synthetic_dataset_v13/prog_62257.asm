; DESCRIPTION: Places a red circle of radius 42 at center (250, 159).
; PLAN: r0=250(x), r1=159(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 159
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
