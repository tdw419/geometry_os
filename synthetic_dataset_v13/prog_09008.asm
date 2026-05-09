; DESCRIPTION: Creates a cyan rectangular region at (341, 156) spanning 96 by 20 pixels.
; PLAN: r0=341(x), r1=156(y), r2=96(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 156
LDI r2, 96
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
