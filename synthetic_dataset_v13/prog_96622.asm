; DESCRIPTION: Creates a cyan rectangular region at (481, 119) spanning 13 by 114 pixels.
; PLAN: r0=481(x), r1=119(y), r2=13(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 119
LDI r2, 13
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
