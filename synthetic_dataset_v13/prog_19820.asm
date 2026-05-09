; DESCRIPTION: Creates a orange rectangular region at (190, 52) spanning 111 by 79 pixels.
; PLAN: r0=190(x), r1=52(y), r2=111(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 52
LDI r2, 111
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
