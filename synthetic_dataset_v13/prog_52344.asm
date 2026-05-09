; DESCRIPTION: Creates a blue rectangular region at (331, 116) spanning 95 by 53 pixels.
; PLAN: r0=331(x), r1=116(y), r2=95(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 116
LDI r2, 95
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
