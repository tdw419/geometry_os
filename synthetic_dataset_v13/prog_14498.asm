; DESCRIPTION: Creates a cyan rectangular region at (0, 35) spanning 25 by 101 pixels.
; PLAN: r0=0(x), r1=35(y), r2=25(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 35
LDI r2, 25
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
