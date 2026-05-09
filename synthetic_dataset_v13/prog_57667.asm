; DESCRIPTION: Creates a blue rectangular region at (234, 2) spanning 26 by 103 pixels.
; PLAN: r0=234(x), r1=2(y), r2=26(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 2
LDI r2, 26
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
