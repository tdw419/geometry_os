; DESCRIPTION: Creates a red rectangular region at (102, 138) spanning 18 by 94 pixels.
; PLAN: r0=102(x), r1=138(y), r2=18(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 138
LDI r2, 18
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
