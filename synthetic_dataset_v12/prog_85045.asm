; DESCRIPTION: Creates a orange rectangular region at (294, 84) spanning 18 by 79 pixels.
; PLAN: r0=294(x), r1=84(y), r2=18(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 84
LDI r2, 18
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
