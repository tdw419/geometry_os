; DESCRIPTION: Creates a magenta rectangular region at (171, 194) spanning 16 by 41 pixels.
; PLAN: r0=171(x), r1=194(y), r2=16(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 194
LDI r2, 16
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
