; DESCRIPTION: Creates a red rectangular region at (245, 118) spanning 27 by 69 pixels.
; PLAN: r0=245(x), r1=118(y), r2=27(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 118
LDI r2, 27
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
