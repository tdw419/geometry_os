; DESCRIPTION: Creates a cyan circular shape at (349, 147) with radius 64.
; PLAN: r0=349(x), r1=147(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 147
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
