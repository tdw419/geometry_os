; DESCRIPTION: Places a white circle of radius 46 at center (63, 152).
; PLAN: r0=63(x), r1=152(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 152
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
