; DESCRIPTION: Creates a black rectangular region at (275, 133) spanning 69 by 91 pixels.
; PLAN: r0=275(x), r1=133(y), r2=69(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 133
LDI r2, 69
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
