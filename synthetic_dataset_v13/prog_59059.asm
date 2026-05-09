; DESCRIPTION: Creates a orange rectangular region at (57, 31) spanning 92 by 94 pixels.
; PLAN: r0=57(x), r1=31(y), r2=92(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 31
LDI r2, 92
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
