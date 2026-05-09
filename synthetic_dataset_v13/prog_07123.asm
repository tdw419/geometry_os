; DESCRIPTION: Creates a yellow rectangular region at (33, 73) spanning 60 by 87 pixels.
; PLAN: r0=33(x), r1=73(y), r2=60(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 73
LDI r2, 60
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
