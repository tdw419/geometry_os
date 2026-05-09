; DESCRIPTION: Creates a blue rectangular region at (320, 26) spanning 69 by 11 pixels.
; PLAN: r0=320(x), r1=26(y), r2=69(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 26
LDI r2, 69
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
