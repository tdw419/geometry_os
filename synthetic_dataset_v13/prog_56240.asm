; DESCRIPTION: Creates a orange rectangular region at (50, 106) spanning 44 by 24 pixels.
; PLAN: r0=50(x), r1=106(y), r2=44(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 106
LDI r2, 44
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
