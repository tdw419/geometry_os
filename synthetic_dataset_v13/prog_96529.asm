; DESCRIPTION: Places a cyan circle of radius 64 at center (323, 83).
; PLAN: r0=323(x), r1=83(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 83
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
