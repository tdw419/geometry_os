; DESCRIPTION: Creates a orange rectangular region at (200, 196) spanning 118 by 21 pixels.
; PLAN: r0=200(x), r1=196(y), r2=118(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 196
LDI r2, 118
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
