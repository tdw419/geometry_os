; DESCRIPTION: Creates a red rectangular region at (40, 120) spanning 19 by 69 pixels.
; PLAN: r0=40(x), r1=120(y), r2=19(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 120
LDI r2, 19
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
