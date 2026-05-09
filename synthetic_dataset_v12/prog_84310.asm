; DESCRIPTION: Creates a black rectangular region at (277, 58) spanning 97 by 117 pixels.
; PLAN: r0=277(x), r1=58(y), r2=97(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 58
LDI r2, 97
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
