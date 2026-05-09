; DESCRIPTION: Creates a black rectangular region at (441, 60) spanning 24 by 111 pixels.
; PLAN: r0=441(x), r1=60(y), r2=24(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 60
LDI r2, 24
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
