; DESCRIPTION: Creates a orange rectangular region at (437, 72) spanning 33 by 75 pixels.
; PLAN: r0=437(x), r1=72(y), r2=33(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 72
LDI r2, 33
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
