; DESCRIPTION: Creates a blue rectangular region at (27, 132) spanning 17 by 111 pixels.
; PLAN: r0=27(x), r1=132(y), r2=17(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 132
LDI r2, 17
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
