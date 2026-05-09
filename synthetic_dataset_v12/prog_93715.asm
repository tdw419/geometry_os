; DESCRIPTION: Creates a cyan rectangular region at (194, 22) spanning 26 by 69 pixels.
; PLAN: r0=194(x), r1=22(y), r2=26(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 22
LDI r2, 26
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
