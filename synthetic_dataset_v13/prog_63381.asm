; DESCRIPTION: Creates a blue rectangular region at (131, 184) spanning 61 by 58 pixels.
; PLAN: r0=131(x), r1=184(y), r2=61(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 184
LDI r2, 61
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
