; DESCRIPTION: Creates a orange rectangular region at (23, 235) spanning 112 by 18 pixels.
; PLAN: r0=23(x), r1=235(y), r2=112(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 235
LDI r2, 112
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
