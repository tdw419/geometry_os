; DESCRIPTION: Creates a purple rectangular region at (250, 165) spanning 69 by 10 pixels.
; PLAN: r0=250(x), r1=165(y), r2=69(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 165
LDI r2, 69
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
