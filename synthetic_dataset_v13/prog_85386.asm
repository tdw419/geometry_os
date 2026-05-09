; DESCRIPTION: Creates a black rectangular region at (199, 152) spanning 45 by 58 pixels.
; PLAN: r0=199(x), r1=152(y), r2=45(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 152
LDI r2, 45
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
