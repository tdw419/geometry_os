; DESCRIPTION: Creates a cyan rectangular region at (67, 98) spanning 38 by 114 pixels.
; PLAN: r0=67(x), r1=98(y), r2=38(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 98
LDI r2, 38
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
