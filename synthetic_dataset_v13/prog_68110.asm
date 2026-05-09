; DESCRIPTION: Creates a yellow rectangular region at (140, 30) spanning 115 by 82 pixels.
; PLAN: r0=140(x), r1=30(y), r2=115(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 30
LDI r2, 115
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
