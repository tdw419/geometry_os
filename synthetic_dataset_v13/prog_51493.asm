; DESCRIPTION: Creates a black rectangular region at (277, 19) spanning 104 by 116 pixels.
; PLAN: r0=277(x), r1=19(y), r2=104(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 19
LDI r2, 104
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
