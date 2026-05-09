; DESCRIPTION: Creates a red rectangular region at (163, 76) spanning 40 by 48 pixels.
; PLAN: r0=163(x), r1=76(y), r2=40(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 76
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
