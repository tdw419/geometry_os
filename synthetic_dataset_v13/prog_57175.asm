; DESCRIPTION: Creates a yellow rectangular region at (405, 184) spanning 75 by 29 pixels.
; PLAN: r0=405(x), r1=184(y), r2=75(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 184
LDI r2, 75
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
