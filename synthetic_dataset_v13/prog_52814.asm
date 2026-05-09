; DESCRIPTION: Creates a cyan rectangular region at (26, 62) spanning 85 by 116 pixels.
; PLAN: r0=26(x), r1=62(y), r2=85(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 62
LDI r2, 85
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
