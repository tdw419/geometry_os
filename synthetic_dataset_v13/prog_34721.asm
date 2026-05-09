; DESCRIPTION: Creates a cyan rectangular region at (1, 67) spanning 43 by 118 pixels.
; PLAN: r0=1(x), r1=67(y), r2=43(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 67
LDI r2, 43
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
