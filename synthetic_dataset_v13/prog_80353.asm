; DESCRIPTION: Creates a red rectangular region at (13, 105) spanning 102 by 59 pixels.
; PLAN: r0=13(x), r1=105(y), r2=102(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 105
LDI r2, 102
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
