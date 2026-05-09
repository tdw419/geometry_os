; DESCRIPTION: Creates a cyan rectangular region at (0, 3) spanning 115 by 116 pixels.
; PLAN: r0=0(x), r1=3(y), r2=115(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 3
LDI r2, 115
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
