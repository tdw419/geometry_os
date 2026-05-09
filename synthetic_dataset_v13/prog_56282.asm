; DESCRIPTION: Creates a yellow rectangular region at (297, 56) spanning 113 by 44 pixels.
; PLAN: r0=297(x), r1=56(y), r2=113(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 56
LDI r2, 113
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
