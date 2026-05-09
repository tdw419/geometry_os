; DESCRIPTION: Creates a black rectangular region at (196, 22) spanning 101 by 111 pixels.
; PLAN: r0=196(x), r1=22(y), r2=101(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 22
LDI r2, 101
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
