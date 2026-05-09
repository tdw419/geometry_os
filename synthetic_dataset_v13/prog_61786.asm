; DESCRIPTION: Creates a red rectangular region at (234, 49) spanning 80 by 33 pixels.
; PLAN: r0=234(x), r1=49(y), r2=80(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 49
LDI r2, 80
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
