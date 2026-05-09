; DESCRIPTION: Places a white circle of radius 75 at center (176, 180).
; PLAN: r0=176(x), r1=180(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 180
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
