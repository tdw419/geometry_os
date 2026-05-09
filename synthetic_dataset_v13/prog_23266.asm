; DESCRIPTION: Creates a purple rectangular region at (271, 86) spanning 41 by 50 pixels.
; PLAN: r0=271(x), r1=86(y), r2=41(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 86
LDI r2, 41
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
