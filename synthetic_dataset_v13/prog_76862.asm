; DESCRIPTION: Creates a black rectangular region at (77, 7) spanning 93 by 61 pixels.
; PLAN: r0=77(x), r1=7(y), r2=93(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 7
LDI r2, 93
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
