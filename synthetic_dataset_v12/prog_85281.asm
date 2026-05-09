; DESCRIPTION: Creates a cyan circular shape at (398, 138) with radius 21.
; PLAN: r0=398(x), r1=138(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 138
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
