; DESCRIPTION: Creates a purple rectangular region at (268, 142) spanning 113 by 87 pixels.
; PLAN: r0=268(x), r1=142(y), r2=113(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 142
LDI r2, 113
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
