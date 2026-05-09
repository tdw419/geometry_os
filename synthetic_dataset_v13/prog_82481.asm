; DESCRIPTION: Creates a cyan rectangular region at (37, 55) spanning 62 by 39 pixels.
; PLAN: r0=37(x), r1=55(y), r2=62(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 55
LDI r2, 62
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
