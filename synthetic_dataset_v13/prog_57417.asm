; DESCRIPTION: Creates a cyan rectangular region at (12, 62) spanning 116 by 33 pixels.
; PLAN: r0=12(x), r1=62(y), r2=116(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 62
LDI r2, 116
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
