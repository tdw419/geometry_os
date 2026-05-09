; DESCRIPTION: Creates a cyan circular shape at (374, 112) with radius 44.
; PLAN: r0=374(x), r1=112(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 112
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
