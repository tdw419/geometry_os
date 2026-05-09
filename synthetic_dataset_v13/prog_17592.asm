; DESCRIPTION: Creates a black rectangular region at (80, 107) spanning 95 by 117 pixels.
; PLAN: r0=80(x), r1=107(y), r2=95(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 107
LDI r2, 95
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
