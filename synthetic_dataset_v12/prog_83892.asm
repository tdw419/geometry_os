; DESCRIPTION: Places a white circle of radius 50 at center (186, 63).
; PLAN: r0=186(x), r1=63(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 63
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
