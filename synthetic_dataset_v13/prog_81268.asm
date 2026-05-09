; DESCRIPTION: Creates a black rectangular region at (226, 223) spanning 90 by 18 pixels.
; PLAN: r0=226(x), r1=223(y), r2=90(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 223
LDI r2, 90
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
