; DESCRIPTION: Creates a black rectangular region at (151, 33) spanning 104 by 90 pixels.
; PLAN: r0=151(x), r1=33(y), r2=104(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 33
LDI r2, 104
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
