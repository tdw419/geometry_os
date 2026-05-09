; DESCRIPTION: Creates a orange rectangular region at (404, 33) spanning 43 by 111 pixels.
; PLAN: r0=404(x), r1=33(y), r2=43(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 33
LDI r2, 43
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
