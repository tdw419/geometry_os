; DESCRIPTION: Creates a orange rectangular region at (436, 209) spanning 60 by 23 pixels.
; PLAN: r0=436(x), r1=209(y), r2=60(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 209
LDI r2, 60
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
