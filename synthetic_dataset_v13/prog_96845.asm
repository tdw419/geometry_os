; DESCRIPTION: Creates a cyan rectangular region at (283, 60) spanning 78 by 62 pixels.
; PLAN: r0=283(x), r1=60(y), r2=78(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 60
LDI r2, 78
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
