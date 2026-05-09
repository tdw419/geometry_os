; DESCRIPTION: Creates a cyan rectangular region at (2, 15) spanning 96 by 14 pixels.
; PLAN: r0=2(x), r1=15(y), r2=96(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 15
LDI r2, 96
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
