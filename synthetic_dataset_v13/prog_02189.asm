; DESCRIPTION: Creates a cyan circular shape at (386, 229) with radius 12.
; PLAN: r0=386(x), r1=229(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 229
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
