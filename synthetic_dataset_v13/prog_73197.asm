; DESCRIPTION: Creates a red rectangular region at (105, 178) spanning 26 by 47 pixels.
; PLAN: r0=105(x), r1=178(y), r2=26(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 178
LDI r2, 26
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
