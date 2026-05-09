; DESCRIPTION: Creates a red rectangular region at (164, 164) spanning 14 by 33 pixels.
; PLAN: r0=164(x), r1=164(y), r2=14(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 164
LDI r2, 14
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
