; DESCRIPTION: Creates a orange rectangular region at (365, 7) spanning 109 by 21 pixels.
; PLAN: r0=365(x), r1=7(y), r2=109(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 7
LDI r2, 109
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
