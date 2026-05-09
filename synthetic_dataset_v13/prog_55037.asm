; DESCRIPTION: Creates a cyan rectangular region at (134, 111) spanning 68 by 88 pixels.
; PLAN: r0=134(x), r1=111(y), r2=68(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 111
LDI r2, 68
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
