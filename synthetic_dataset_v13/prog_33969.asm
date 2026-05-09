; DESCRIPTION: Creates a black rectangular region at (337, 142) spanning 63 by 80 pixels.
; PLAN: r0=337(x), r1=142(y), r2=63(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 142
LDI r2, 63
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
