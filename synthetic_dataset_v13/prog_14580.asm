; DESCRIPTION: Creates a cyan rectangular region at (158, 77) spanning 23 by 12 pixels.
; PLAN: r0=158(x), r1=77(y), r2=23(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 77
LDI r2, 23
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
