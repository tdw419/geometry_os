; DESCRIPTION: Creates a orange rectangular region at (402, 184) spanning 104 by 72 pixels.
; PLAN: r0=402(x), r1=184(y), r2=104(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 184
LDI r2, 104
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
