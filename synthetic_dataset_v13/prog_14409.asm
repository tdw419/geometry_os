; DESCRIPTION: Creates a orange rectangular region at (70, 86) spanning 11 by 96 pixels.
; PLAN: r0=70(x), r1=86(y), r2=11(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 86
LDI r2, 11
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
