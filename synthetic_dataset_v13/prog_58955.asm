; DESCRIPTION: Creates a cyan rectangular region at (338, 88) spanning 26 by 116 pixels.
; PLAN: r0=338(x), r1=88(y), r2=26(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 88
LDI r2, 26
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
