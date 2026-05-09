; DESCRIPTION: Creates a cyan rectangular region at (26, 156) spanning 51 by 34 pixels.
; PLAN: r0=26(x), r1=156(y), r2=51(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 156
LDI r2, 51
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
