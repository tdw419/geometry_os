; DESCRIPTION: Creates a red rectangular region at (89, 138) spanning 102 by 10 pixels.
; PLAN: r0=89(x), r1=138(y), r2=102(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 138
LDI r2, 102
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
