; DESCRIPTION: Creates a black rectangular region at (99, 187) spanning 120 by 66 pixels.
; PLAN: r0=99(x), r1=187(y), r2=120(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 187
LDI r2, 120
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
