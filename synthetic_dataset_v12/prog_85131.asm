; DESCRIPTION: Creates a red rectangular region at (55, 68) spanning 39 by 115 pixels.
; PLAN: r0=55(x), r1=68(y), r2=39(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 68
LDI r2, 39
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
