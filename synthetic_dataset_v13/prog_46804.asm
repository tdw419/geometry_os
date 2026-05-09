; DESCRIPTION: Creates a orange rectangular region at (313, 71) spanning 81 by 95 pixels.
; PLAN: r0=313(x), r1=71(y), r2=81(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 71
LDI r2, 81
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
