; DESCRIPTION: Creates a orange rectangular region at (378, 149) spanning 16 by 75 pixels.
; PLAN: r0=378(x), r1=149(y), r2=16(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 149
LDI r2, 16
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
