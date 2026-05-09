; DESCRIPTION: Creates a red rectangular region at (164, 24) spanning 76 by 22 pixels.
; PLAN: r0=164(x), r1=24(y), r2=76(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 24
LDI r2, 76
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
