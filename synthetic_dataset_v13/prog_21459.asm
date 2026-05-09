; DESCRIPTION: Creates a red rectangular region at (337, 86) spanning 36 by 89 pixels.
; PLAN: r0=337(x), r1=86(y), r2=36(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 86
LDI r2, 36
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
