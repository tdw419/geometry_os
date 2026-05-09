; DESCRIPTION: Creates a red rectangular region at (214, 71) spanning 119 by 84 pixels.
; PLAN: r0=214(x), r1=71(y), r2=119(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 71
LDI r2, 119
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
