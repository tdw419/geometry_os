; DESCRIPTION: Places a green circle of radius 60 at center (66, 192).
; PLAN: r0=66(x), r1=192(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 192
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
