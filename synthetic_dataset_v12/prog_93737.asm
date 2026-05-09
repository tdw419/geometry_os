; DESCRIPTION: Creates a purple rectangular region at (105, 148) spanning 33 by 50 pixels.
; PLAN: r0=105(x), r1=148(y), r2=33(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 148
LDI r2, 33
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
