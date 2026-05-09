; DESCRIPTION: Creates a cyan circular shape at (295, 84) with radius 29.
; PLAN: r0=295(x), r1=84(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 84
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
