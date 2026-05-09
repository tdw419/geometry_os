; DESCRIPTION: Creates a orange rectangular region at (236, 113) spanning 20 by 95 pixels.
; PLAN: r0=236(x), r1=113(y), r2=20(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 113
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
