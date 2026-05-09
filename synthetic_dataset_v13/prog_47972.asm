; DESCRIPTION: Creates a black rectangular region at (174, 103) spanning 58 by 58 pixels.
; PLAN: r0=174(x), r1=103(y), r2=58(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 103
LDI r2, 58
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
