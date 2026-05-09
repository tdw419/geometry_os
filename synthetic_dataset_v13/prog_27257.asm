; DESCRIPTION: Creates a black rectangular region at (263, 5) spanning 75 by 90 pixels.
; PLAN: r0=263(x), r1=5(y), r2=75(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 5
LDI r2, 75
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
