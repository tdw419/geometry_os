; DESCRIPTION: Creates a cyan rectangular region at (261, 125) spanning 41 by 68 pixels.
; PLAN: r0=261(x), r1=125(y), r2=41(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 125
LDI r2, 41
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
