; DESCRIPTION: Creates a cyan rectangular region at (347, 126) spanning 62 by 41 pixels.
; PLAN: r0=347(x), r1=126(y), r2=62(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 126
LDI r2, 62
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
