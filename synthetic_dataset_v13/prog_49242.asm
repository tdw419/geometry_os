; DESCRIPTION: Creates a cyan circular shape at (328, 125) with radius 26.
; PLAN: r0=328(x), r1=125(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 125
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
