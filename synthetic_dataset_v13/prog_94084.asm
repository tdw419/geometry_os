; DESCRIPTION: Creates a orange rectangular region at (3, 159) spanning 99 by 59 pixels.
; PLAN: r0=3(x), r1=159(y), r2=99(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 159
LDI r2, 99
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
