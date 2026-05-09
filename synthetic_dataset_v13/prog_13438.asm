; DESCRIPTION: Places a white circle of radius 60 at center (403, 120).
; PLAN: r0=403(x), r1=120(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 120
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
