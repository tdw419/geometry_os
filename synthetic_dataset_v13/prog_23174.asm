; DESCRIPTION: Creates a cyan rectangular region at (190, 116) spanning 34 by 108 pixels.
; PLAN: r0=190(x), r1=116(y), r2=34(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 116
LDI r2, 34
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
