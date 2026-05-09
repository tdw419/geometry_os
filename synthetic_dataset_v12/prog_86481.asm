; DESCRIPTION: Creates a blue rectangular region at (167, 58) spanning 93 by 76 pixels.
; PLAN: r0=167(x), r1=58(y), r2=93(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 58
LDI r2, 93
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
