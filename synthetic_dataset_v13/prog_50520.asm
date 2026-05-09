; DESCRIPTION: Creates a purple rectangular region at (45, 76) spanning 103 by 48 pixels.
; PLAN: r0=45(x), r1=76(y), r2=103(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 76
LDI r2, 103
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
