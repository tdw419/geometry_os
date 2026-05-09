; DESCRIPTION: Creates a purple rectangular region at (310, 177) spanning 65 by 32 pixels.
; PLAN: r0=310(x), r1=177(y), r2=65(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 177
LDI r2, 65
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
