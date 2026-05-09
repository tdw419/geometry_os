; DESCRIPTION: Creates a cyan rectangular region at (63, 52) spanning 15 by 41 pixels.
; PLAN: r0=63(x), r1=52(y), r2=15(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 52
LDI r2, 15
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
