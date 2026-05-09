; DESCRIPTION: Creates a white rectangular region at (400, 116) spanning 108 by 104 pixels.
; PLAN: r0=400(x), r1=116(y), r2=108(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 116
LDI r2, 108
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
