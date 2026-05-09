; DESCRIPTION: Places a white circle of radius 36 at center (186, 80).
; PLAN: r0=186(x), r1=80(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 80
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
