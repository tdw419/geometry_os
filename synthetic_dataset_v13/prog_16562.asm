; DESCRIPTION: Creates a orange rectangular region at (9, 86) spanning 86 by 93 pixels.
; PLAN: r0=9(x), r1=86(y), r2=86(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 86
LDI r2, 86
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
