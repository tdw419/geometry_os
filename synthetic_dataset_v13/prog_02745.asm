; DESCRIPTION: Creates a orange rectangular region at (57, 20) spanning 56 by 73 pixels.
; PLAN: r0=57(x), r1=20(y), r2=56(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 20
LDI r2, 56
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
