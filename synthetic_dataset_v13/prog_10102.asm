; DESCRIPTION: Creates a yellow rectangular region at (112, 157) spanning 103 by 28 pixels.
; PLAN: r0=112(x), r1=157(y), r2=103(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 157
LDI r2, 103
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
