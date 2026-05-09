; DESCRIPTION: Creates a blue rectangular region at (241, 20) spanning 95 by 72 pixels.
; PLAN: r0=241(x), r1=20(y), r2=95(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 20
LDI r2, 95
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
