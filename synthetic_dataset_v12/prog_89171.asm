; DESCRIPTION: Creates a orange rectangular region at (133, 94) spanning 79 by 111 pixels.
; PLAN: r0=133(x), r1=94(y), r2=79(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 94
LDI r2, 79
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
