; DESCRIPTION: Creates a orange rectangular region at (381, 120) spanning 28 by 112 pixels.
; PLAN: r0=381(x), r1=120(y), r2=28(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 120
LDI r2, 28
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
