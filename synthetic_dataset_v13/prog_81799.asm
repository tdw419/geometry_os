; DESCRIPTION: Creates a orange rectangular region at (249, 112) spanning 62 by 111 pixels.
; PLAN: r0=249(x), r1=112(y), r2=62(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 112
LDI r2, 62
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
