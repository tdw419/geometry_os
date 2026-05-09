; DESCRIPTION: Creates a red rectangular region at (204, 51) spanning 63 by 112 pixels.
; PLAN: r0=204(x), r1=51(y), r2=63(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 51
LDI r2, 63
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
