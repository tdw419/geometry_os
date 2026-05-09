; DESCRIPTION: Creates a blue rectangular region at (362, 18) spanning 63 by 67 pixels.
; PLAN: r0=362(x), r1=18(y), r2=63(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 18
LDI r2, 63
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
