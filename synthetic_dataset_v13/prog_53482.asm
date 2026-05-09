; DESCRIPTION: Creates a cyan circular shape at (410, 115) with radius 58.
; PLAN: r0=410(x), r1=115(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 115
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
