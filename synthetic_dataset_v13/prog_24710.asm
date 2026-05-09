; DESCRIPTION: Creates a black rectangular region at (162, 21) spanning 80 by 30 pixels.
; PLAN: r0=162(x), r1=21(y), r2=80(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 21
LDI r2, 80
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
