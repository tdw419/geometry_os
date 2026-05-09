; DESCRIPTION: Places a white circle of radius 40 at center (213, 180).
; PLAN: r0=213(x), r1=180(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 180
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
