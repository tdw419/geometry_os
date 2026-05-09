; DESCRIPTION: Creates a red rectangular region at (279, 133) spanning 100 by 89 pixels.
; PLAN: r0=279(x), r1=133(y), r2=100(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 133
LDI r2, 100
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
