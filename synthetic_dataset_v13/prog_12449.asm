; DESCRIPTION: Creates a blue rectangular region at (36, 81) spanning 83 by 82 pixels.
; PLAN: r0=36(x), r1=81(y), r2=83(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 81
LDI r2, 83
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
