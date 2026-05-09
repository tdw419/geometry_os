; DESCRIPTION: Places a green circle of radius 73 at center (249, 177).
; PLAN: r0=249(x), r1=177(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 177
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
