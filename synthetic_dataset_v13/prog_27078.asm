; DESCRIPTION: Places a white circle of radius 43 at center (267, 169).
; PLAN: r0=267(x), r1=169(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 169
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
