; DESCRIPTION: Creates a yellow rectangular region at (329, 134) spanning 26 by 115 pixels.
; PLAN: r0=329(x), r1=134(y), r2=26(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 134
LDI r2, 26
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
