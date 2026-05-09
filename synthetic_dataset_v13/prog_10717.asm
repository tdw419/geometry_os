; DESCRIPTION: Creates a cyan rectangular region at (116, 31) spanning 64 by 53 pixels.
; PLAN: r0=116(x), r1=31(y), r2=64(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 31
LDI r2, 64
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
