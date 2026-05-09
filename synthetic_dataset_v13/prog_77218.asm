; DESCRIPTION: Creates a cyan circular shape at (196, 150) with radius 56.
; PLAN: r0=196(x), r1=150(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 150
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
