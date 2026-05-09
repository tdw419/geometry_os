; DESCRIPTION: Places a red circle of radius 50 at center (367, 127).
; PLAN: r0=367(x), r1=127(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 127
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
