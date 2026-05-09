; DESCRIPTION: Creates a cyan rectangular region at (406, 183) spanning 102 by 11 pixels.
; PLAN: r0=406(x), r1=183(y), r2=102(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 183
LDI r2, 102
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
