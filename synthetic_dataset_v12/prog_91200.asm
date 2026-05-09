; DESCRIPTION: Creates a orange rectangular region at (161, 196) spanning 29 by 38 pixels.
; PLAN: r0=161(x), r1=196(y), r2=29(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 196
LDI r2, 29
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
