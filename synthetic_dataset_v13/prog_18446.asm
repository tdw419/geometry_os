; DESCRIPTION: Creates a orange rectangular region at (152, 29) spanning 12 by 25 pixels.
; PLAN: r0=152(x), r1=29(y), r2=12(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 29
LDI r2, 12
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
