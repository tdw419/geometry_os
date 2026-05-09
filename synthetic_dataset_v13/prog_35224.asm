; DESCRIPTION: Creates a orange rectangular region at (160, 165) spanning 75 by 83 pixels.
; PLAN: r0=160(x), r1=165(y), r2=75(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 165
LDI r2, 75
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
