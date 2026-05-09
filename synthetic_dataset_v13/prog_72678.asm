; DESCRIPTION: Creates a red rectangular region at (359, 162) spanning 39 by 29 pixels.
; PLAN: r0=359(x), r1=162(y), r2=39(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 162
LDI r2, 39
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
