; DESCRIPTION: Creates a cyan rectangular region at (83, 196) spanning 89 by 57 pixels.
; PLAN: r0=83(x), r1=196(y), r2=89(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 196
LDI r2, 89
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
