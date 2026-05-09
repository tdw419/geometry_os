; DESCRIPTION: Creates a black rectangular region at (201, 152) spanning 103 by 25 pixels.
; PLAN: r0=201(x), r1=152(y), r2=103(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 152
LDI r2, 103
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
