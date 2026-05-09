; DESCRIPTION: Creates a orange rectangular region at (404, 30) spanning 66 by 83 pixels.
; PLAN: r0=404(x), r1=30(y), r2=66(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 30
LDI r2, 66
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
