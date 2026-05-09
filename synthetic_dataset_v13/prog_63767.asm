; DESCRIPTION: Creates a cyan circular shape at (460, 163) with radius 38.
; PLAN: r0=460(x), r1=163(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 163
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
