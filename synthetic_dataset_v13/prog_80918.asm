; DESCRIPTION: Creates a white rectangular region at (337, 69) spanning 68 by 17 pixels.
; PLAN: r0=337(x), r1=69(y), r2=68(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 69
LDI r2, 68
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
