; DESCRIPTION: Creates a orange rectangular region at (422, 106) spanning 75 by 66 pixels.
; PLAN: r0=422(x), r1=106(y), r2=75(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 106
LDI r2, 75
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
