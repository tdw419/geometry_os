; DESCRIPTION: Creates a cyan circular shape at (358, 127) with radius 38.
; PLAN: r0=358(x), r1=127(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 127
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
