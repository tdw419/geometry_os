; DESCRIPTION: Creates a orange rectangular region at (233, 70) spanning 27 by 91 pixels.
; PLAN: r0=233(x), r1=70(y), r2=27(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 70
LDI r2, 27
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
