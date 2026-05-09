; DESCRIPTION: Creates a orange rectangular region at (278, 87) spanning 86 by 90 pixels.
; PLAN: r0=278(x), r1=87(y), r2=86(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 87
LDI r2, 86
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
