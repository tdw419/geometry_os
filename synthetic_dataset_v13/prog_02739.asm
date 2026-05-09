; DESCRIPTION: Creates a orange rectangular region at (90, 33) spanning 75 by 109 pixels.
; PLAN: r0=90(x), r1=33(y), r2=75(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 33
LDI r2, 75
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
