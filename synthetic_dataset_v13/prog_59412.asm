; DESCRIPTION: Creates a cyan circular shape at (169, 56) with radius 44.
; PLAN: r0=169(x), r1=56(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 56
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
