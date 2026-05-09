; DESCRIPTION: Creates a black rectangular region at (159, 8) spanning 30 by 51 pixels.
; PLAN: r0=159(x), r1=8(y), r2=30(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 8
LDI r2, 30
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
