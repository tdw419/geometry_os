; DESCRIPTION: Creates a cyan circular shape at (410, 33) with radius 28.
; PLAN: r0=410(x), r1=33(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 33
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
