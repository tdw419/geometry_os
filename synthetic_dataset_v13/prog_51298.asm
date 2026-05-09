; DESCRIPTION: Creates a orange rectangular region at (441, 213) spanning 23 by 20 pixels.
; PLAN: r0=441(x), r1=213(y), r2=23(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 213
LDI r2, 23
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
