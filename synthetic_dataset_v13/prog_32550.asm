; DESCRIPTION: Creates a orange rectangular region at (296, 62) spanning 90 by 111 pixels.
; PLAN: r0=296(x), r1=62(y), r2=90(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 62
LDI r2, 90
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
