; DESCRIPTION: Creates a cyan rectangular region at (12, 39) spanning 114 by 26 pixels.
; PLAN: r0=12(x), r1=39(y), r2=114(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 39
LDI r2, 114
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
