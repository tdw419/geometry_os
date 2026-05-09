; DESCRIPTION: Creates a cyan rectangular region at (195, 41) spanning 53 by 46 pixels.
; PLAN: r0=195(x), r1=41(y), r2=53(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 41
LDI r2, 53
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
