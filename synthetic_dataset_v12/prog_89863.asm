; DESCRIPTION: Creates a cyan rectangular region at (85, 183) spanning 106 by 35 pixels.
; PLAN: r0=85(x), r1=183(y), r2=106(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 183
LDI r2, 106
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
