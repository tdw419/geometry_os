; DESCRIPTION: Creates a red rectangular region at (337, 56) spanning 37 by 35 pixels.
; PLAN: r0=337(x), r1=56(y), r2=37(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 56
LDI r2, 37
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
