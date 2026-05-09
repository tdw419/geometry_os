; DESCRIPTION: Creates a blue rectangular region at (234, 148) spanning 44 by 85 pixels.
; PLAN: r0=234(x), r1=148(y), r2=44(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 148
LDI r2, 44
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
