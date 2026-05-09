; DESCRIPTION: Creates a cyan rectangular region at (49, 53) spanning 106 by 71 pixels.
; PLAN: r0=49(x), r1=53(y), r2=106(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 53
LDI r2, 106
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
