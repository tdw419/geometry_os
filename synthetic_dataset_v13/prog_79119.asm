; DESCRIPTION: Creates a yellow rectangular region at (60, 143) spanning 25 by 112 pixels.
; PLAN: r0=60(x), r1=143(y), r2=25(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 143
LDI r2, 25
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
