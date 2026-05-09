; DESCRIPTION: Creates a orange rectangular region at (421, 204) spanning 22 by 51 pixels.
; PLAN: r0=421(x), r1=204(y), r2=22(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 204
LDI r2, 22
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
