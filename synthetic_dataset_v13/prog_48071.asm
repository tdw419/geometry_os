; DESCRIPTION: Creates a orange rectangular region at (404, 18) spanning 13 by 104 pixels.
; PLAN: r0=404(x), r1=18(y), r2=13(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 18
LDI r2, 13
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
