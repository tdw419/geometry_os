; DESCRIPTION: Creates a blue rectangular region at (12, 58) spanning 95 by 73 pixels.
; PLAN: r0=12(x), r1=58(y), r2=95(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 58
LDI r2, 95
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
