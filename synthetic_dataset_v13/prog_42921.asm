; DESCRIPTION: Creates a black rectangular region at (131, 46) spanning 51 by 113 pixels.
; PLAN: r0=131(x), r1=46(y), r2=51(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 46
LDI r2, 51
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
