; DESCRIPTION: Creates a black rectangular region at (152, 133) spanning 114 by 65 pixels.
; PLAN: r0=152(x), r1=133(y), r2=114(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 133
LDI r2, 114
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
