; DESCRIPTION: Creates a red rectangular region at (3, 150) spanning 44 by 41 pixels.
; PLAN: r0=3(x), r1=150(y), r2=44(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 150
LDI r2, 44
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
