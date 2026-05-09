; DESCRIPTION: Creates a orange rectangular region at (212, 152) spanning 60 by 80 pixels.
; PLAN: r0=212(x), r1=152(y), r2=60(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 152
LDI r2, 60
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
