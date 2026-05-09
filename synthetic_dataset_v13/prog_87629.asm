; DESCRIPTION: Creates a orange rectangular region at (125, 145) spanning 117 by 27 pixels.
; PLAN: r0=125(x), r1=145(y), r2=117(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 145
LDI r2, 117
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
