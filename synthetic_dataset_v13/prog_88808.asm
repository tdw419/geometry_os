; DESCRIPTION: Creates a cyan rectangular region at (194, 36) spanning 34 by 96 pixels.
; PLAN: r0=194(x), r1=36(y), r2=34(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 36
LDI r2, 34
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
