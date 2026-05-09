; DESCRIPTION: Creates a cyan circular shape at (447, 129) with radius 27.
; PLAN: r0=447(x), r1=129(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 129
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
