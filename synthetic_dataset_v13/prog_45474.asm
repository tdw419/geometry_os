; DESCRIPTION: Creates a orange rectangular region at (4, 132) spanning 74 by 47 pixels.
; PLAN: r0=4(x), r1=132(y), r2=74(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 132
LDI r2, 74
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
