; DESCRIPTION: Creates a cyan rectangular region at (7, 101) spanning 18 by 21 pixels.
; PLAN: r0=7(x), r1=101(y), r2=18(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 101
LDI r2, 18
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
