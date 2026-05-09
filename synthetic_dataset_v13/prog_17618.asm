; DESCRIPTION: Creates a red rectangular region at (291, 161) spanning 14 by 60 pixels.
; PLAN: r0=291(x), r1=161(y), r2=14(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 161
LDI r2, 14
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
