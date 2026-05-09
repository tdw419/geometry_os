; DESCRIPTION: Creates a red rectangular region at (338, 69) spanning 44 by 24 pixels.
; PLAN: r0=338(x), r1=69(y), r2=44(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 69
LDI r2, 44
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
