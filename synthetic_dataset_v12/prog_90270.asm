; DESCRIPTION: Creates a cyan circular shape at (196, 125) with radius 48.
; PLAN: r0=196(x), r1=125(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 125
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
