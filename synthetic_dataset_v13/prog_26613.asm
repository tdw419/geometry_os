; DESCRIPTION: Creates a blue rectangular region at (127, 183) spanning 103 by 23 pixels.
; PLAN: r0=127(x), r1=183(y), r2=103(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 183
LDI r2, 103
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
