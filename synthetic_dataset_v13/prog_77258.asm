; DESCRIPTION: Creates a black rectangular region at (400, 21) spanning 45 by 75 pixels.
; PLAN: r0=400(x), r1=21(y), r2=45(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 21
LDI r2, 45
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
