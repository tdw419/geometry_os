; DESCRIPTION: Creates a cyan rectangular region at (363, 106) spanning 114 by 102 pixels.
; PLAN: r0=363(x), r1=106(y), r2=114(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 106
LDI r2, 114
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
