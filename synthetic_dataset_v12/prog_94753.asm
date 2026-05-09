; DESCRIPTION: Creates a green rectangular region at (234, 127) spanning 95 by 34 pixels.
; PLAN: r0=234(x), r1=127(y), r2=95(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 127
LDI r2, 95
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
