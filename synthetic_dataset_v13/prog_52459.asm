; DESCRIPTION: Creates a orange rectangular region at (145, 39) spanning 47 by 36 pixels.
; PLAN: r0=145(x), r1=39(y), r2=47(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 39
LDI r2, 47
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
