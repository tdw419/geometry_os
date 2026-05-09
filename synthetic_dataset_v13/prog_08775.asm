; DESCRIPTION: Creates a cyan rectangular region at (225, 126) spanning 41 by 114 pixels.
; PLAN: r0=225(x), r1=126(y), r2=41(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 126
LDI r2, 41
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
