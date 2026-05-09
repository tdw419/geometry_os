; DESCRIPTION: Creates a blue rectangular region at (215, 63) spanning 114 by 15 pixels.
; PLAN: r0=215(x), r1=63(y), r2=114(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 63
LDI r2, 114
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
