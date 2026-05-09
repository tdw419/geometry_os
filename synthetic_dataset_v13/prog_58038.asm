; DESCRIPTION: Creates a cyan rectangular region at (96, 43) spanning 37 by 116 pixels.
; PLAN: r0=96(x), r1=43(y), r2=37(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 43
LDI r2, 37
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
