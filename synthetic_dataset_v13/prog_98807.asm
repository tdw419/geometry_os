; DESCRIPTION: Creates a cyan rectangular region at (78, 54) spanning 90 by 67 pixels.
; PLAN: r0=78(x), r1=54(y), r2=90(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 54
LDI r2, 90
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
