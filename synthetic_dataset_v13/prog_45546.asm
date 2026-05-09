; DESCRIPTION: Creates a cyan circular shape at (450, 106) with radius 54.
; PLAN: r0=450(x), r1=106(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 106
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
