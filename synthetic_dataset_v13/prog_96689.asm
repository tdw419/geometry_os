; DESCRIPTION: Creates a orange rectangular region at (319, 48) spanning 31 by 111 pixels.
; PLAN: r0=319(x), r1=48(y), r2=31(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 48
LDI r2, 31
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
