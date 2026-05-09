; DESCRIPTION: Creates a white rectangular region at (84, 208) spanning 111 by 46 pixels.
; PLAN: r0=84(x), r1=208(y), r2=111(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 208
LDI r2, 111
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
