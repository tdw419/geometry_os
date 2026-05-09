; DESCRIPTION: Creates a yellow rectangular region at (192, 51) spanning 51 by 111 pixels.
; PLAN: r0=192(x), r1=51(y), r2=51(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 51
LDI r2, 51
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
