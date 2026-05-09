; DESCRIPTION: Creates a red rectangular region at (20, 163) spanning 70 by 28 pixels.
; PLAN: r0=20(x), r1=163(y), r2=70(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 163
LDI r2, 70
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
