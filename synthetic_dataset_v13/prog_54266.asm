; DESCRIPTION: Places a red circle of radius 37 at center (464, 186).
; PLAN: r0=464(x), r1=186(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 186
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
