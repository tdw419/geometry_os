; DESCRIPTION: Creates a orange rectangular region at (240, 4) spanning 83 by 48 pixels.
; PLAN: r0=240(x), r1=4(y), r2=83(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 4
LDI r2, 83
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
