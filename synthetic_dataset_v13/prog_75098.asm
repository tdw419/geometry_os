; DESCRIPTION: Places a cyan circle of radius 75 at center (199, 86).
; PLAN: r0=199(x), r1=86(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 86
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
