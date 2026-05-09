; DESCRIPTION: Creates a blue rectangular region at (183, 166) spanning 21 by 76 pixels.
; PLAN: r0=183(x), r1=166(y), r2=21(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 166
LDI r2, 21
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
