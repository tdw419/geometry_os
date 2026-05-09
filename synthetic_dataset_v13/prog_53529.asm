; DESCRIPTION: Creates a orange rectangular region at (156, 19) spanning 12 by 86 pixels.
; PLAN: r0=156(x), r1=19(y), r2=12(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 19
LDI r2, 12
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
