; DESCRIPTION: Creates a cyan rectangular region at (203, 55) spanning 73 by 57 pixels.
; PLAN: r0=203(x), r1=55(y), r2=73(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 55
LDI r2, 73
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
