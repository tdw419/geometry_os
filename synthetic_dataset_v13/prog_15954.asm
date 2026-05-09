; DESCRIPTION: Creates a orange rectangular region at (375, 225) spanning 14 by 10 pixels.
; PLAN: r0=375(x), r1=225(y), r2=14(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 225
LDI r2, 14
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
