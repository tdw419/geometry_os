; DESCRIPTION: Creates a cyan rectangular region at (100, 9) spanning 100 by 96 pixels.
; PLAN: r0=100(x), r1=9(y), r2=100(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 9
LDI r2, 100
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
