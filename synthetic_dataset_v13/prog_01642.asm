; DESCRIPTION: Creates a cyan rectangular region at (93, 52) spanning 114 by 24 pixels.
; PLAN: r0=93(x), r1=52(y), r2=114(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 52
LDI r2, 114
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
