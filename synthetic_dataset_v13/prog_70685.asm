; DESCRIPTION: Places a cyan circle of radius 52 at center (276, 94).
; PLAN: r0=276(x), r1=94(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 94
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
