; DESCRIPTION: Creates a orange rectangular region at (27, 120) spanning 119 by 99 pixels.
; PLAN: r0=27(x), r1=120(y), r2=119(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 120
LDI r2, 119
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
