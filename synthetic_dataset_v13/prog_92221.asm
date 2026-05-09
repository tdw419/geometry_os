; DESCRIPTION: Creates a orange rectangular region at (136, 64) spanning 90 by 98 pixels.
; PLAN: r0=136(x), r1=64(y), r2=90(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 64
LDI r2, 90
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
