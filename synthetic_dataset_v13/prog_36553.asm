; DESCRIPTION: Creates a purple rectangular region at (330, 97) spanning 41 by 68 pixels.
; PLAN: r0=330(x), r1=97(y), r2=41(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 97
LDI r2, 41
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
