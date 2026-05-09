; DESCRIPTION: Creates a cyan rectangular region at (41, 73) spanning 61 by 113 pixels.
; PLAN: r0=41(x), r1=73(y), r2=61(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 73
LDI r2, 61
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
