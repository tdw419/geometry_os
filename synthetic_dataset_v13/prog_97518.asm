; DESCRIPTION: Creates a blue rectangular region at (292, 135) spanning 94 by 76 pixels.
; PLAN: r0=292(x), r1=135(y), r2=94(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 135
LDI r2, 94
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
