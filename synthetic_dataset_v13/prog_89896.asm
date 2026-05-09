; DESCRIPTION: Creates a blue rectangular region at (177, 142) spanning 107 by 82 pixels.
; PLAN: r0=177(x), r1=142(y), r2=107(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 142
LDI r2, 107
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
