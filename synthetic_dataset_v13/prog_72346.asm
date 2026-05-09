; DESCRIPTION: Creates a yellow rectangular region at (421, 5) spanning 72 by 85 pixels.
; PLAN: r0=421(x), r1=5(y), r2=72(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 5
LDI r2, 72
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
