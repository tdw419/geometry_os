; DESCRIPTION: Creates a red rectangular region at (337, 138) spanning 66 by 81 pixels.
; PLAN: r0=337(x), r1=138(y), r2=66(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 138
LDI r2, 66
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
