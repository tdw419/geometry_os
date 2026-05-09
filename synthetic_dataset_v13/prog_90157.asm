; DESCRIPTION: Creates a cyan rectangular region at (324, 20) spanning 95 by 116 pixels.
; PLAN: r0=324(x), r1=20(y), r2=95(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 20
LDI r2, 95
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
