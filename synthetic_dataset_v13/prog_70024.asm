; DESCRIPTION: Creates a cyan rectangular region at (330, 6) spanning 68 by 41 pixels.
; PLAN: r0=330(x), r1=6(y), r2=68(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 6
LDI r2, 68
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
