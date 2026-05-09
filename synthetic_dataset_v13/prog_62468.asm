; DESCRIPTION: Creates a cyan rectangular region at (89, 101) spanning 85 by 61 pixels.
; PLAN: r0=89(x), r1=101(y), r2=85(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 101
LDI r2, 85
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
