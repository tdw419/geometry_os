; DESCRIPTION: Creates a black rectangular region at (277, 145) spanning 69 by 41 pixels.
; PLAN: r0=277(x), r1=145(y), r2=69(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 145
LDI r2, 69
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
