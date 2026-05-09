; DESCRIPTION: Creates a cyan rectangular region at (41, 126) spanning 33 by 58 pixels.
; PLAN: r0=41(x), r1=126(y), r2=33(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 126
LDI r2, 33
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
