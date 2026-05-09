; DESCRIPTION: Creates a cyan circular shape at (350, 112) with radius 57.
; PLAN: r0=350(x), r1=112(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 112
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
