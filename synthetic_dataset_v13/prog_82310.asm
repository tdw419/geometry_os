; DESCRIPTION: Creates a orange rectangular region at (404, 58) spanning 35 by 72 pixels.
; PLAN: r0=404(x), r1=58(y), r2=35(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 58
LDI r2, 35
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
