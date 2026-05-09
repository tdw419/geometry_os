; DESCRIPTION: Places a black circle of radius 47 at center (263, 169).
; PLAN: r0=263(x), r1=169(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 169
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
