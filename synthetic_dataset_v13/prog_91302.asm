; DESCRIPTION: Creates a cyan rectangular region at (272, 60) spanning 114 by 43 pixels.
; PLAN: r0=272(x), r1=60(y), r2=114(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 60
LDI r2, 114
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
