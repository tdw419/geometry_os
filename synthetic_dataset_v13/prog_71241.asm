; DESCRIPTION: Creates a orange rectangular region at (21, 198) spanning 21 by 38 pixels.
; PLAN: r0=21(x), r1=198(y), r2=21(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 198
LDI r2, 21
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
