; DESCRIPTION: Creates a cyan circular shape at (106, 209) with radius 24.
; PLAN: r0=106(x), r1=209(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 209
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
