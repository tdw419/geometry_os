; DESCRIPTION: Places a cyan circle of radius 57 at center (79, 158).
; PLAN: r0=79(x), r1=158(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 158
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
