; DESCRIPTION: Creates a yellow rectangular region at (377, 82) spanning 87 by 62 pixels.
; PLAN: r0=377(x), r1=82(y), r2=87(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 82
LDI r2, 87
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
