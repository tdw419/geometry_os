; DESCRIPTION: Creates a yellow rectangular region at (326, 17) spanning 112 by 113 pixels.
; PLAN: r0=326(x), r1=17(y), r2=112(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 17
LDI r2, 112
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
