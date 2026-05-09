; DESCRIPTION: Creates a orange rectangular region at (59, 29) spanning 91 by 118 pixels.
; PLAN: r0=59(x), r1=29(y), r2=91(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 29
LDI r2, 91
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
