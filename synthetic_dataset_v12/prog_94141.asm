; DESCRIPTION: Creates a orange rectangular region at (377, 107) spanning 43 by 18 pixels.
; PLAN: r0=377(x), r1=107(y), r2=43(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 107
LDI r2, 43
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
