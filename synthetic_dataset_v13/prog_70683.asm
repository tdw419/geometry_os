; DESCRIPTION: Creates a orange rectangular region at (442, 163) spanning 66 by 79 pixels.
; PLAN: r0=442(x), r1=163(y), r2=66(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 163
LDI r2, 66
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
