; DESCRIPTION: Creates a orange rectangular region at (384, 109) spanning 118 by 94 pixels.
; PLAN: r0=384(x), r1=109(y), r2=118(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 109
LDI r2, 118
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
