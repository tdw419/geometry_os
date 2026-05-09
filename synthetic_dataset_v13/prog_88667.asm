; DESCRIPTION: Creates a orange rectangular region at (3, 28) spanning 39 by 87 pixels.
; PLAN: r0=3(x), r1=28(y), r2=39(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 28
LDI r2, 39
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
