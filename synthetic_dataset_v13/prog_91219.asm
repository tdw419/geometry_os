; DESCRIPTION: Creates a blue rectangular region at (45, 10) spanning 72 by 21 pixels.
; PLAN: r0=45(x), r1=10(y), r2=72(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 10
LDI r2, 72
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
