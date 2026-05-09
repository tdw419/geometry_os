; DESCRIPTION: Creates a purple rectangular region at (111, 159) spanning 63 by 26 pixels.
; PLAN: r0=111(x), r1=159(y), r2=63(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 159
LDI r2, 63
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
