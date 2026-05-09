; DESCRIPTION: Creates a purple rectangular region at (329, 50) spanning 58 by 55 pixels.
; PLAN: r0=329(x), r1=50(y), r2=58(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 50
LDI r2, 58
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
