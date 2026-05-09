; DESCRIPTION: Creates a black rectangular region at (145, 4) spanning 95 by 90 pixels.
; PLAN: r0=145(x), r1=4(y), r2=95(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 4
LDI r2, 95
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
