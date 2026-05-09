; DESCRIPTION: Creates a black rectangular region at (40, 150) spanning 30 by 10 pixels.
; PLAN: r0=40(x), r1=150(y), r2=30(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 150
LDI r2, 30
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
