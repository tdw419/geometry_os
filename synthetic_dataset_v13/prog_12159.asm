; DESCRIPTION: Creates a orange rectangular region at (94, 81) spanning 92 by 82 pixels.
; PLAN: r0=94(x), r1=81(y), r2=92(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 81
LDI r2, 92
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
