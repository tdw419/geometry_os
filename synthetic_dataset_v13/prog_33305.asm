; DESCRIPTION: Places a green circle of radius 71 at center (262, 152).
; PLAN: r0=262(x), r1=152(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 152
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
