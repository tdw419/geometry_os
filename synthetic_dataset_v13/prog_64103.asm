; DESCRIPTION: Creates a cyan rectangular region at (20, 4) spanning 101 by 41 pixels.
; PLAN: r0=20(x), r1=4(y), r2=101(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 4
LDI r2, 101
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
