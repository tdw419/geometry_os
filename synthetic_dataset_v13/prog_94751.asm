; DESCRIPTION: Creates a black rectangular region at (2, 196) spanning 69 by 59 pixels.
; PLAN: r0=2(x), r1=196(y), r2=69(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 196
LDI r2, 69
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
