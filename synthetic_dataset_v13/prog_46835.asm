; DESCRIPTION: Creates a orange rectangular region at (57, 103) spanning 112 by 84 pixels.
; PLAN: r0=57(x), r1=103(y), r2=112(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 103
LDI r2, 112
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
