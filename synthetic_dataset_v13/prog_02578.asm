; DESCRIPTION: Creates a red rectangular region at (435, 140) spanning 69 by 97 pixels.
; PLAN: r0=435(x), r1=140(y), r2=69(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 140
LDI r2, 69
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
