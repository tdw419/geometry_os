; DESCRIPTION: Creates a cyan circular shape at (158, 152) with radius 34.
; PLAN: r0=158(x), r1=152(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 152
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
