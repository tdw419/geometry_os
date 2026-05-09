; DESCRIPTION: Creates a black rectangular region at (279, 89) spanning 19 by 39 pixels.
; PLAN: r0=279(x), r1=89(y), r2=19(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 89
LDI r2, 19
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
