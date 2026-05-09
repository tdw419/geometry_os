; DESCRIPTION: Creates a cyan rectangular region at (409, 67) spanning 34 by 88 pixels.
; PLAN: r0=409(x), r1=67(y), r2=34(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 67
LDI r2, 34
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
