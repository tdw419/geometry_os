; DESCRIPTION: Places a cyan circle of radius 52 at center (217, 57).
; PLAN: r0=217(x), r1=57(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 57
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
