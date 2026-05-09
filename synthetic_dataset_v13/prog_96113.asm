; DESCRIPTION: Creates a red rectangular region at (265, 29) spanning 107 by 90 pixels.
; PLAN: r0=265(x), r1=29(y), r2=107(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 29
LDI r2, 107
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
