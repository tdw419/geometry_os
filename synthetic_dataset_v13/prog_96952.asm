; DESCRIPTION: Creates a cyan rectangular region at (126, 1) spanning 114 by 108 pixels.
; PLAN: r0=126(x), r1=1(y), r2=114(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 1
LDI r2, 114
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
