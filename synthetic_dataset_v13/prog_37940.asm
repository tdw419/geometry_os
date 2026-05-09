; DESCRIPTION: Creates a yellow rectangular region at (191, 143) spanning 11 by 33 pixels.
; PLAN: r0=191(x), r1=143(y), r2=11(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 143
LDI r2, 11
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
