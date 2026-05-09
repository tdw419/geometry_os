; DESCRIPTION: Creates a red rectangular region at (300, 46) spanning 105 by 26 pixels.
; PLAN: r0=300(x), r1=46(y), r2=105(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 46
LDI r2, 105
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
