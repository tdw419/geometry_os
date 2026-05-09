; DESCRIPTION: Creates a orange rectangular region at (106, 27) spanning 120 by 72 pixels.
; PLAN: r0=106(x), r1=27(y), r2=120(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 27
LDI r2, 120
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
