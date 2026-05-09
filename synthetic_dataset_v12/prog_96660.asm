; DESCRIPTION: Creates a orange rectangular region at (250, 195) spanning 49 by 16 pixels.
; PLAN: r0=250(x), r1=195(y), r2=49(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 195
LDI r2, 49
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
