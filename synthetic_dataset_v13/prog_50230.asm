; DESCRIPTION: Creates a black rectangular region at (389, 101) spanning 27 by 44 pixels.
; PLAN: r0=389(x), r1=101(y), r2=27(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 101
LDI r2, 27
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
