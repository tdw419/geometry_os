; DESCRIPTION: Creates a red rectangular region at (477, 145) spanning 10 by 82 pixels.
; PLAN: r0=477(x), r1=145(y), r2=10(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 145
LDI r2, 10
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
