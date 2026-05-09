; DESCRIPTION: Places a cyan circle of radius 47 at center (233, 192).
; PLAN: r0=233(x), r1=192(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 192
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
