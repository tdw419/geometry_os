; DESCRIPTION: Creates a cyan rectangular region at (15, 68) spanning 116 by 119 pixels.
; PLAN: r0=15(x), r1=68(y), r2=116(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 68
LDI r2, 116
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
