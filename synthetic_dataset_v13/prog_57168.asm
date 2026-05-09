; DESCRIPTION: Creates a black rectangular region at (33, 117) spanning 50 by 58 pixels.
; PLAN: r0=33(x), r1=117(y), r2=50(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 117
LDI r2, 50
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
