; DESCRIPTION: Creates a purple rectangular region at (66, 62) spanning 113 by 111 pixels.
; PLAN: r0=66(x), r1=62(y), r2=113(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 62
LDI r2, 113
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
