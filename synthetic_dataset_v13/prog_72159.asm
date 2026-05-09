; DESCRIPTION: Creates a cyan rectangular region at (85, 76) spanning 116 by 93 pixels.
; PLAN: r0=85(x), r1=76(y), r2=116(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 76
LDI r2, 116
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
