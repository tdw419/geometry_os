; DESCRIPTION: Creates a blue rectangular region at (389, 140) spanning 39 by 95 pixels.
; PLAN: r0=389(x), r1=140(y), r2=39(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 140
LDI r2, 39
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
