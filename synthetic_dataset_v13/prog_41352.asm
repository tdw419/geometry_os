; DESCRIPTION: Creates a magenta rectangular region at (204, 98) spanning 107 by 11 pixels.
; PLAN: r0=204(x), r1=98(y), r2=107(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 98
LDI r2, 107
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
