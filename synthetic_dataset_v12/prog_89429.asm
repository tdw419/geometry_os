; DESCRIPTION: Places a white circle of radius 72 at center (180, 182).
; PLAN: r0=180(x), r1=182(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 182
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
