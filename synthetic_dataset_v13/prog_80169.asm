; DESCRIPTION: Creates a red rectangular region at (230, 137) spanning 19 by 112 pixels.
; PLAN: r0=230(x), r1=137(y), r2=19(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 137
LDI r2, 19
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
