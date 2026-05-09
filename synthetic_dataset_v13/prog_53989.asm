; DESCRIPTION: Creates a cyan circular shape at (380, 168) with radius 70.
; PLAN: r0=380(x), r1=168(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 168
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
