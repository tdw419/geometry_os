; DESCRIPTION: Places a green circle of radius 70 at center (92, 125).
; PLAN: r0=92(x), r1=125(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 125
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
