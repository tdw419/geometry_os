; DESCRIPTION: Creates a orange rectangular region at (271, 114) spanning 94 by 112 pixels.
; PLAN: r0=271(x), r1=114(y), r2=94(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 114
LDI r2, 94
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
