; DESCRIPTION: Creates a black rectangular region at (126, 124) spanning 69 by 92 pixels.
; PLAN: r0=126(x), r1=124(y), r2=69(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 124
LDI r2, 69
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
