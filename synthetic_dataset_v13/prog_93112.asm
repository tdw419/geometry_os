; DESCRIPTION: Creates a cyan rectangular region at (116, 49) spanning 55 by 71 pixels.
; PLAN: r0=116(x), r1=49(y), r2=55(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 49
LDI r2, 55
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
