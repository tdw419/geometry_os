; DESCRIPTION: Creates a orange rectangular region at (152, 193) spanning 39 by 60 pixels.
; PLAN: r0=152(x), r1=193(y), r2=39(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 193
LDI r2, 39
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
