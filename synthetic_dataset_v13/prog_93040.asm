; DESCRIPTION: Places a cyan circle of radius 54 at center (57, 66).
; PLAN: r0=57(x), r1=66(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 66
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
