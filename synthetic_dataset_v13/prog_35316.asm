; DESCRIPTION: Creates a orange rectangular region at (44, 143) spanning 80 by 75 pixels.
; PLAN: r0=44(x), r1=143(y), r2=80(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 143
LDI r2, 80
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
