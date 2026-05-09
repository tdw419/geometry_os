; DESCRIPTION: Creates a cyan rectangular region at (115, 24) spanning 116 by 96 pixels.
; PLAN: r0=115(x), r1=24(y), r2=116(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 24
LDI r2, 116
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
