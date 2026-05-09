; DESCRIPTION: Creates a red rectangular region at (77, 149) spanning 99 by 12 pixels.
; PLAN: r0=77(x), r1=149(y), r2=99(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 149
LDI r2, 99
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
