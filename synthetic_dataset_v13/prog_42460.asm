; DESCRIPTION: Creates a cyan rectangular region at (60, 22) spanning 52 by 114 pixels.
; PLAN: r0=60(x), r1=22(y), r2=52(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 22
LDI r2, 52
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
