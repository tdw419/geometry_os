; DESCRIPTION: Creates a blue rectangular region at (116, 131) spanning 72 by 18 pixels.
; PLAN: r0=116(x), r1=131(y), r2=72(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 131
LDI r2, 72
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
