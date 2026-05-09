; DESCRIPTION: Creates a blue rectangular region at (63, 166) spanning 25 by 71 pixels.
; PLAN: r0=63(x), r1=166(y), r2=25(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 166
LDI r2, 25
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
