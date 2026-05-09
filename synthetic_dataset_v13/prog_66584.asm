; DESCRIPTION: Creates a red rectangular region at (123, 123) spanning 71 by 92 pixels.
; PLAN: r0=123(x), r1=123(y), r2=71(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 123
LDI r2, 71
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
