; DESCRIPTION: Creates a cyan rectangular region at (312, 54) spanning 102 by 93 pixels.
; PLAN: r0=312(x), r1=54(y), r2=102(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 54
LDI r2, 102
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
