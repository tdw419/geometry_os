; DESCRIPTION: Creates a red rectangular region at (200, 89) spanning 16 by 82 pixels.
; PLAN: r0=200(x), r1=89(y), r2=16(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 89
LDI r2, 16
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
