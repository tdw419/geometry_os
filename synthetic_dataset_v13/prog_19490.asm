; DESCRIPTION: Creates a cyan rectangular region at (41, 45) spanning 60 by 82 pixels.
; PLAN: r0=41(x), r1=45(y), r2=60(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 45
LDI r2, 60
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
