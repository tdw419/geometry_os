; DESCRIPTION: Creates a purple rectangular region at (284, 148) spanning 43 by 105 pixels.
; PLAN: r0=284(x), r1=148(y), r2=43(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 148
LDI r2, 43
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
