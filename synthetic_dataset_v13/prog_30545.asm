; DESCRIPTION: Creates a yellow rectangular region at (384, 25) spanning 92 by 112 pixels.
; PLAN: r0=384(x), r1=25(y), r2=92(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 25
LDI r2, 92
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
