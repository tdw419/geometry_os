; DESCRIPTION: Creates a black rectangular region at (379, 50) spanning 52 by 70 pixels.
; PLAN: r0=379(x), r1=50(y), r2=52(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 50
LDI r2, 52
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
