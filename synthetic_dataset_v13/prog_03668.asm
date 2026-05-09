; DESCRIPTION: Creates a orange rectangular region at (156, 36) spanning 105 by 79 pixels.
; PLAN: r0=156(x), r1=36(y), r2=105(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 36
LDI r2, 105
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
