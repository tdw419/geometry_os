; DESCRIPTION: Creates a blue rectangular region at (18, 183) spanning 45 by 56 pixels.
; PLAN: r0=18(x), r1=183(y), r2=45(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 183
LDI r2, 45
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
