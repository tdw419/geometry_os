; DESCRIPTION: Creates a magenta rectangular region at (236, 41) spanning 68 by 117 pixels.
; PLAN: r0=236(x), r1=41(y), r2=68(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 41
LDI r2, 68
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
