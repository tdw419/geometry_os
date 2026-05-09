; DESCRIPTION: Creates a orange rectangular region at (246, 10) spanning 80 by 111 pixels.
; PLAN: r0=246(x), r1=10(y), r2=80(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 10
LDI r2, 80
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
