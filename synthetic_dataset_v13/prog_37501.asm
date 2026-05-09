; DESCRIPTION: Creates a purple rectangular region at (367, 50) spanning 117 by 105 pixels.
; PLAN: r0=367(x), r1=50(y), r2=117(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 50
LDI r2, 117
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
