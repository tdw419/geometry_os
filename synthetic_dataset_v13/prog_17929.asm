; DESCRIPTION: Creates a cyan rectangular region at (93, 227) spanning 81 by 10 pixels.
; PLAN: r0=93(x), r1=227(y), r2=81(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 227
LDI r2, 81
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
