; DESCRIPTION: Creates a blue rectangular region at (259, 161) spanning 103 by 26 pixels.
; PLAN: r0=259(x), r1=161(y), r2=103(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 161
LDI r2, 103
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
