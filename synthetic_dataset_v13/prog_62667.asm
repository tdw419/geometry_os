; DESCRIPTION: Creates a orange rectangular region at (236, 117) spanning 38 by 25 pixels.
; PLAN: r0=236(x), r1=117(y), r2=38(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 117
LDI r2, 38
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
