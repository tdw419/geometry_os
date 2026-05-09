; DESCRIPTION: Creates a cyan circular shape at (146, 79) with radius 14.
; PLAN: r0=146(x), r1=79(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 79
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
