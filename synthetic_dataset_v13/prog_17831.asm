; DESCRIPTION: Creates a cyan circular shape at (306, 65) with radius 38.
; PLAN: r0=306(x), r1=65(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 65
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
