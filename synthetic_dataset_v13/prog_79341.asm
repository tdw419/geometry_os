; DESCRIPTION: Creates a green rectangular region at (234, 238) spanning 33 by 10 pixels.
; PLAN: r0=234(x), r1=238(y), r2=33(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 238
LDI r2, 33
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
