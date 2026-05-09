; DESCRIPTION: Creates a black rectangular region at (160, 27) spanning 81 by 66 pixels.
; PLAN: r0=160(x), r1=27(y), r2=81(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 27
LDI r2, 81
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
