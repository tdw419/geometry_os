; DESCRIPTION: Creates a green rectangular region at (337, 102) spanning 76 by 95 pixels.
; PLAN: r0=337(x), r1=102(y), r2=76(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 102
LDI r2, 76
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
