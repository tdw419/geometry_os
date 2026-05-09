; DESCRIPTION: Creates a cyan rectangular region at (90, 18) spanning 41 by 10 pixels.
; PLAN: r0=90(x), r1=18(y), r2=41(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 18
LDI r2, 41
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
