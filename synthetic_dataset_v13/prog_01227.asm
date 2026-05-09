; DESCRIPTION: Creates a black rectangular region at (198, 87) spanning 120 by 13 pixels.
; PLAN: r0=198(x), r1=87(y), r2=120(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 87
LDI r2, 120
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
