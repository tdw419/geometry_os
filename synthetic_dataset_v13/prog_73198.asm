; DESCRIPTION: Creates a red rectangular region at (76, 124) spanning 91 by 100 pixels.
; PLAN: r0=76(x), r1=124(y), r2=91(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 124
LDI r2, 91
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
