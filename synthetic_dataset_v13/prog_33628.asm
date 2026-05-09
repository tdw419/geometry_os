; DESCRIPTION: Creates a black rectangular region at (363, 107) spanning 10 by 100 pixels.
; PLAN: r0=363(x), r1=107(y), r2=10(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 107
LDI r2, 10
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
