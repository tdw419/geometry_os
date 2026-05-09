; DESCRIPTION: Creates a blue rectangular region at (214, 75) spanning 58 by 56 pixels.
; PLAN: r0=214(x), r1=75(y), r2=58(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 75
LDI r2, 58
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
