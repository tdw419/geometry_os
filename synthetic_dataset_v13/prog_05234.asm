; DESCRIPTION: Creates a cyan circular shape at (117, 113) with radius 57.
; PLAN: r0=117(x), r1=113(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 113
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
