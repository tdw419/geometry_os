; DESCRIPTION: Creates a orange rectangular region at (273, 148) spanning 80 by 54 pixels.
; PLAN: r0=273(x), r1=148(y), r2=80(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 148
LDI r2, 80
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
