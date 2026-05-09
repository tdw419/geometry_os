; DESCRIPTION: Creates a cyan rectangular region at (121, 92) spanning 41 by 109 pixels.
; PLAN: r0=121(x), r1=92(y), r2=41(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 92
LDI r2, 41
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
