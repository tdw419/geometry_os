; DESCRIPTION: Creates a orange rectangular region at (182, 72) spanning 47 by 94 pixels.
; PLAN: r0=182(x), r1=72(y), r2=47(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 72
LDI r2, 47
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
