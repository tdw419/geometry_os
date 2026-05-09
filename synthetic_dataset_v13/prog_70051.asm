; DESCRIPTION: Creates a orange rectangular region at (90, 57) spanning 12 by 55 pixels.
; PLAN: r0=90(x), r1=57(y), r2=12(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 57
LDI r2, 12
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
