; DESCRIPTION: Creates a orange rectangular region at (96, 106) spanning 94 by 20 pixels.
; PLAN: r0=96(x), r1=106(y), r2=94(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 106
LDI r2, 94
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
