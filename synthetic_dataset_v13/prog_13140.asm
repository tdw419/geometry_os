; DESCRIPTION: Creates a black rectangular region at (8, 93) spanning 91 by 51 pixels.
; PLAN: r0=8(x), r1=93(y), r2=91(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 93
LDI r2, 91
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
