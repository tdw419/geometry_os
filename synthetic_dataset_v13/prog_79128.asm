; DESCRIPTION: Creates a orange rectangular region at (185, 31) spanning 115 by 40 pixels.
; PLAN: r0=185(x), r1=31(y), r2=115(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 31
LDI r2, 115
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
