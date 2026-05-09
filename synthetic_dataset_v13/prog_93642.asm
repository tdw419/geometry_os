; DESCRIPTION: Creates a orange rectangular region at (80, 138) spanning 63 by 109 pixels.
; PLAN: r0=80(x), r1=138(y), r2=63(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 138
LDI r2, 63
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
