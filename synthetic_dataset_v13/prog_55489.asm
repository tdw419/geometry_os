; DESCRIPTION: Creates a black rectangular region at (84, 111) spanning 107 by 111 pixels.
; PLAN: r0=84(x), r1=111(y), r2=107(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 111
LDI r2, 107
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
