; DESCRIPTION: Creates a black rectangular region at (159, 58) spanning 68 by 111 pixels.
; PLAN: r0=159(x), r1=58(y), r2=68(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 58
LDI r2, 68
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
