; DESCRIPTION: Creates a red rectangular region at (249, 11) spanning 18 by 96 pixels.
; PLAN: r0=249(x), r1=11(y), r2=18(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 11
LDI r2, 18
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
