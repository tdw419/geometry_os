; DESCRIPTION: Creates a red rectangular region at (143, 146) spanning 114 by 108 pixels.
; PLAN: r0=143(x), r1=146(y), r2=114(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 146
LDI r2, 114
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
