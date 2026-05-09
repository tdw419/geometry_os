; DESCRIPTION: Creates a orange rectangular region at (179, 78) spanning 52 by 82 pixels.
; PLAN: r0=179(x), r1=78(y), r2=52(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 78
LDI r2, 52
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
