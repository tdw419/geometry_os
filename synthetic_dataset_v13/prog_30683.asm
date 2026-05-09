; DESCRIPTION: Creates a black rectangular region at (85, 120) spanning 91 by 22 pixels.
; PLAN: r0=85(x), r1=120(y), r2=91(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 120
LDI r2, 91
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
