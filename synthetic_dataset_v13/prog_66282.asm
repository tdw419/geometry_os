; DESCRIPTION: Creates a purple rectangular region at (245, 63) spanning 112 by 17 pixels.
; PLAN: r0=245(x), r1=63(y), r2=112(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 63
LDI r2, 112
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
